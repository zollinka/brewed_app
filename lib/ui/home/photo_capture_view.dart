import 'package:brewed/ui/home/photo_display_view.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class PhotoCaptureView extends StatefulWidget {
  final CameraDescription camera;
  const PhotoCaptureView({
    Key key,
    @required this.camera,
  }) : super(key: key);

  @override
  _PhotoCaptureViewState createState() => _PhotoCaptureViewState();
}

class _PhotoCaptureViewState extends State<PhotoCaptureView> {
  CameraController _controller;
  Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();

    _controller = CameraController(
      widget.camera,
      ResolutionPreset.max,
    );

    _initializeControllerFuture = _controller.initialize();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Take photo of beer label')),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
          }
          else{
            return Center(child: CircularProgressIndicator(),);
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            await _initializeControllerFuture;

            final path = join(
              (await getTemporaryDirectory()).path,
              '${DateTime.now()}.png',
            );

            await _controller.takePicture(path);
            Navigator.push(context,
                MaterialPageRoute(
                  builder: (context) => PhotoDisplayView(imagePath: path), //response.data.toString(),),
                ));
          }
          catch (e) {
            print(e);
          }
        },
      ),
    );
  }
}