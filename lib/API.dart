import 'dart:convert';
import 'dart:io';
import 'package:brewed/ui/home/filters.dart';
import 'package:brewed/ui/rating/Rating.dart';
import 'package:device_info/device_info.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';


class API {
  static Dio dio;
  static String deviceId;
  static Future<void> init() async{
    dio = new Dio();
    dio.options.baseUrl= "https://brewed.pl";
    dio.options.connectTimeout=100000;
    var deviceInfo = DeviceInfoPlugin();
    var androidDeviceInfo = await deviceInfo.androidInfo;
    deviceId = androidDeviceInfo.androidId;
  }

  static Future <dynamic> predict(imagePath) async{

    //dio.options.baseUrl= "http://192.168.0.109:5000";
    dio.interceptors.add(LogInterceptor(request: true, requestBody: true, requestHeader: true, responseBody: true));
    String fileName = imagePath.split('/').last;
    FormData formData = new FormData.fromMap({"image": await MultipartFile.fromFile(imagePath,filename: fileName, contentType: new MediaType('image', 'jpeg')
    )});
    final response = await dio.post("/api/predict",
        data: formData,
        options: Options(contentType: 'multipart/form-data')
    );
    return response.data;
  }

  static Future <List<dynamic>> search() async {
    //dio.options.baseUrl= "http://192.168.0.104";
    final response = await dio.get("/getbeers");
    return response.data;
  }

  static Future <List<dynamic>> getBeers() async {
    //dio.options.baseUrl= "http://192.168.0.104";
    try{final response = await dio.get("/api/beer");
    return response.data;}
    catch(e){}
  }

  static Future <List<dynamic>> getFilteredBeers() async {
    //dio.options.baseUrl= "http://192.168.0.104";
    var data = Filters.toMap();
    try{final response = await dio.post("/api/beer/filter", data: data);
    return response.data;}
    catch(e) {}

  }

  static Future <dynamic> getBeer() async {
    //dio.options.baseUrl= "http://demo8592060.mockable.io";
    final response = await dio.get("/getbeer");
    return response.data;
  }

  static Future <dynamic> getBeerByBarcode(String barCode) async {
    //dio.options.baseUrl= "http://192.168.0.104";
    final response = await dio.get("/api/beer", queryParameters: {"barCode": barCode});
    return response.data;
  }

  static Future <dynamic> getBeerByName(String name) async {
    //dio.options.baseUrl= "http://192.168.0.104";
    final response = await dio.get("/api/beer", queryParameters: {"name": name}, options: Options(
    followRedirects: true));
    return response.data;
  }

  static Future <dynamic> getRatingByBeer(String beerId) async {
    //dio.options.baseUrl= "http://192.168.0.104";
    try{
    final response = await dio.get('/api/beer-ratings', queryParameters: {"beerId": beerId, "userId": deviceId});
    return response.data;}
    catch(e)
    {
      if (e.response.statusCode == 500 || e.response.statusCode == 404)
        {
          return null;
        }
    }

  }

  static Future <dynamic> getAttributeOfBeer(String beerId) async {
    //dio.options.baseUrl= "http://192.168.0.104";
    try{final response = await dio.get('/api/beer-ratings/compound', queryParameters: {"beerId": beerId});
    return response.data;}
    catch(e)
    {
      if (e.response.statusCode== 500)
      {
        return null;
      }
    }
  }

  static Future<void> putRating(Rating rating) async {
    //dio.options.baseUrl= "http://192.168.0.104";
    await dio.put('/api/beer-ratings', data: rating.toJson(deviceId));
  }

  static Future<List<dynamic>> searchByName(String searchString) async {
    final data = {"name": searchString};
    try{
      final response = await dio.post("/api/beer/findByAttrs", data: data);
      return response.data;}
    catch(e) {return null;}
  }
  static Future<List<dynamic>> searchByBreweryName(String searchString) async {
    final data = {"breweryName": searchString};
    try{
      final response = await dio.post("/api/beer/findByAttrs", data: data);
      return response.data;}
    catch(e) {return null;}
  }

  /*
  static Future <dynamic> getRatingByBeer(String beerId) async {
    dio.options.baseUrl= "http://192.168.1.136:80";
    final response = await dio.get("/api/beer-ratings");
    return response.data;
  }
   */


}