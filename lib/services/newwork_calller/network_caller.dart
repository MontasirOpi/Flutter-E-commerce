import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class NetworkResponse {
  final bool isSuccess;
  final int statusCode;
  final dynamic resopnseData;
  final String errorMessage;

  NetworkResponse(
      {required this.isSuccess,
      required this.statusCode,
      this.resopnseData,
      this.errorMessage = 'Something went Wrong'});
}

class NetworkCaller {
  final Logger _logger = Logger();
  Future<NetworkResponse> getRequest(String url) async {
    try {
      Uri uri = Uri.parse(url);
      _logRequets(url);
     http.Response response = await http.get(uri);
     // Response response = await get(uri); class a amon chilo
      _logResponse(url, response.statusCode, response.headers, response.body);
      _logger.i('STATUS=>$url');
      if (response.statusCode == 200) {
        final decodedMessage = jsonDecode(response.body);
        return NetworkResponse(
            isSuccess: true,
            statusCode: response.statusCode,
            resopnseData: decodedMessage);
      } else {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      _logResponse(url, -1, {}, '',e.toString());
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }
  Future<NetworkResponse> postRequest(String url,{Map<String,dynamic>? body}) async {
    try {
      Uri uri = Uri.parse(url);
      Map<String,String> headers ={
       'content-type':'application/json'
      };
      _logRequets(url,headers,body);
     http.Response response = await http.post(uri,headers: headers,body: jsonEncode(body));
     // Response response = await get(uri); class a amon chilo
      _logResponse(url, response.statusCode, response.headers, response.body);
      _logger.i('STATUS=>$url');
      if (response.statusCode == 200) {
        final decodedMessage = jsonDecode(response.body);
        return NetworkResponse(
            isSuccess: true,
            statusCode: response.statusCode,
            resopnseData: decodedMessage);
      } else {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      _logResponse(url, -1, {}, '',e.toString());
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  void _logRequets(String url,
      [Map<String, dynamic>? heders, Map<String, dynamic>? body]) {
    _logger.i('URL =>$url\nHEDERS =>$heders\nBODY =>$body');
  }

  void _logResponse(
      String url, int statusCode, Map<String, String>? heders, String body,
      [String? errorMessage]) {
    if (errorMessage != null) {
      _logger.e(
          'URL =>$url\nError Message =>$errorMessage');
    } else {
      _logger.i(
          'URL =>$url\nHEDERS =>$heders\nStatus Code =>$statusCode\nBODY =>$body');
    }
  }
}
