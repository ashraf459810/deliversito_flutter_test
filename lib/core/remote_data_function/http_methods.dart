import 'dart:developer';
import 'package:http/http.dart' as http;

import '../error/app_excepition.dart';

abstract class HttpFunctions {
  Future<http.Response> getMethod(
      {required String url, required String baseurl});
}

class HttpFunctionsImp implements HttpFunctions {
  http.Client client = http.Client();

  @override
  Future<http.Response> getMethod(
      {required String url, required String baseurl}) async {
    final response = await client.get(
      Uri.parse(baseurl + url),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    log(baseurl + url);
    log(response.statusCode.toString());
    log(response.body.toString());

    switch (response.statusCode) {
      case 200:
        return response;
      case 400:
        throw BadRequestException("BadRequestException");
      case 401:
        throw UnauthorisedException("UnauthorisedException");

      case 404:
        throw NotFound("status 404 :: Not Found");
      case 500:
        throw InternalServerError("InternalServerError");

      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
