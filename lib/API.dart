import 'package:dio/dio.dart';


class API {
  static Dio dio;

  static void init(){
    dio = new Dio();
    dio.options.baseUrl= "http://192.168.1.136:5000";
    dio.options.connectTimeout=100000;
  }

  static Future <void> predict(imagePath) async{
    FormData formData = new FormData.fromMap({"image": await MultipartFile.fromFile(imagePath)});
    final response = await dio.post("/api/predict",
        data: formData,
        onSendProgress: (int sent, int total) {
          print("$sent $total");}
    );
    return response.data;
  }

  static Future <List<dynamic>> search() async {
    dio.options.baseUrl= "http://demo8592060.mockable.io";
    final response = await dio.get("/getbeers");
    return response.data;
  }

  static Future <List<dynamic>> getBeers() async {
    dio.options.baseUrl= "http://192.168.1.136:80";
    final response = await dio.get("/api/beer/get");
    return response.data;
  }

  static Future <dynamic> getBeer() async {
    dio.options.baseUrl= "http://demo8592060.mockable.io";
    final response = await dio.get("/getbeer");
    return response.data;
  }
}