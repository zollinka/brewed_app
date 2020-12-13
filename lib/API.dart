import 'dart:convert';
import 'dart:io';
import 'package:brewed/ui/rating/Rating.dart';
import 'package:device_info/device_info.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';


class API {
  static Dio dio;
  static String deviceId;
  static Future<void> init() async{
    dio = new Dio();
    dio.options.baseUrl= "http://192.168.1.136:80";
    dio.options.connectTimeout=100000;
    var deviceInfo = DeviceInfoPlugin();
    var androidDeviceInfo = await deviceInfo.androidInfo;
    deviceId = androidDeviceInfo.androidId;
  }

  static Future <dynamic> predict(imagePath) async{

    dio.options.baseUrl= "http://192.168.1.131:5000";
    dio.interceptors.add(LogInterceptor(request: true, requestBody: true, requestHeader: true, responseBody: true));
    String fileName = imagePath.split('/').last;
    FormData formData = new FormData.fromMap({"image": await MultipartFile.fromFile(imagePath,filename: fileName, contentType: new MediaType('image', 'jpeg')
    )});
    print(formData.files.first.value.filename);
    final response = await dio.post("/api/predict",
        data: formData,
        onSendProgress: (int sent, int total) {
          print("$sent $total");},
        options: Options(contentType: 'multipart/form-data')
    );
    print(response.data);
    return response.data;
  }

  static Future <List<dynamic>> search() async {
    dio.options.baseUrl= "http://demo8592060.mockable.io";
    final response = await dio.get("/getbeers");
    return response.data;
  }

  static Future <List<dynamic>> getBeers() async {
    dio.options.baseUrl= "http://192.168.1.136:80";
    final response = await dio.get("/api/beer");
    return response.data;
  }

  static Future <dynamic> getBeer() async {
    dio.options.baseUrl= "http://demo8592060.mockable.io";
    final response = await dio.get("/getbeer");
    return response.data;
  }

  static Future <dynamic> getBeerByBarcode(String barCode) async {
    dio.options.baseUrl= "http://192.168.1.136:80";
    final response = await dio.get("/api/beer", queryParameters: {"barCode": barCode});
    return response.data;
  }

  static Future <dynamic> getBeerByName(String name) async {
    dio.options.baseUrl= "http://192.168.1.136:80";
    final response = await dio.get("/api/beer", queryParameters: {"name": name});
    return response.data;
  }

  static Future <dynamic> getRatingByBeer(String beerId) async {
    dio.options.baseUrl= "http://demo8592060.mockable.io";
    final response = await dio.get("/getRating");
    return response.data;
  }

  static Future <dynamic> getAttributeOfBeer(String beerId) async {
    dio.options.baseUrl= "http://192.168.1.136:80";
    final response = await dio.get('/api/beer-ratings/compound', queryParameters: {"beerId": beerId});
    print(response.data);
    return response.data;
  }

  static Future<void> putRating(Rating rating) async {
    dio.options.baseUrl= "http://192.168.1.136:80";
    await dio.put('/api/beer-ratings', data: rating.toJson(deviceId));
  }

  /*
  static Future <dynamic> getRatingByBeer(String beerId) async {
    dio.options.baseUrl= "http://192.168.1.136:80";
    final response = await dio.get("/api/beer-ratings");
    return response.data;
  }
   */


}