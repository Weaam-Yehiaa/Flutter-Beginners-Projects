import 'dart:convert';

import 'package:dio/dio.dart';

class DioHelper{

  static Dio? dio;

  static init(){ //static 34an awl ma aft7 al app w astd3y DioHelper ttnfz

    dio=Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type':'application/json',
          //'lang':'en',
        },
      ),
    );


  }

  static Future<Response?> getData({
    required String url,
    required Map<String,dynamic> query,
    String lang='ar',
    String? token,
  })async
  {

    dio!.options.headers={
        'lang':lang,
        'Authorization':token,
      };

    return await dio?.get(url,queryParameters: query,);
  }
  static Future<Response?> postData({
    required String url,
    Map<String,dynamic>? query,
    required Map<String,dynamic>data,
    String lang='ar',
    String? token,
  })async
  {
    dio!.options.headers=
    {
      'lang':lang,
      'Authorization':token,
    };

    return await dio?.post(
      url,
      queryParameters: query,
      data: json.encode(data),
    );
  }
}