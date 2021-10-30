import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mvvm_project_sample/model/apis/app_exception.dart';
import 'package:mvvm_project_sample/model/services/base_service.dart';
import 'package:http/http.dart' as http;

class FoodService extends BaseService {
  @override //override our getResponse method to get value from our local json
  Future getResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(mediaBaseUrl + url));

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataExcption();
    }

    return responseJson;
  }

  @visibleForTesting
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        throw UnAuthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataExcption('''
        Error occured while communication with server with Status Code : ${response.statusCode}''');
    }
  }
}
