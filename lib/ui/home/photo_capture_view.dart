import 'dart:io';

import 'package:brewed/ui/Constants.dart';
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
      ResolutionPreset.low,
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
      appBar: AppBar(title: Text(Constants.takePhoto)),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: Stack(
                children: <Widget>[
                  Positioned.fill(child: CameraPreview(_controller)),
                  Positioned.fill(
                      child: Opacity(
                    opacity: 0.4,
                    child: Image.asset('lib/assets/camera_overlay.png',
                      fit: BoxFit.fill,),
                    ))
            ]));
          }
          else{
            return Center(
              child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera),
        onPressed: () async {
          try {
            await _initializeControllerFuture;
            XFile photo = await _controller.takePicture();
            Navigator.push(context,
                MaterialPageRoute(
                  builder: (context) => PhotoDisplayView(imagePath: photo.path), //response.data.toString(),),
                ));
          }
          catch (e) {
          }
        },

      ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
    );
  }
}