import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_app/src/core/config.dart';
import 'package:flutter_app/src/services/app_response.dart';
import 'package:http/http.dart' as http;

class AppHttpManager {
  Future<AppResponse> get({
    required String path,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  }) async {
    log('Request: GET');
    http.Response response = await http.get(
      Uri.parse(_uriBuilder(path: path, query: query)),
      headers: _headersBuilder(headers),
    );
    return returnResponse(response);
  }

  Future<AppResponse> post({
    required String path,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
  }) async {
    log('Request: POST');
    log('Body: ${body.toString()}');
    http.Response response = await http.post(
      Uri.parse(_uriBuilder(path: path, query: query)),
      headers: _headersBuilder(headers),
      body: jsonEncode(body),
    );
    return returnResponse(response);
  }

  Future<AppResponse> put({
    required String path,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
  }) async {
    log('Request: PUT');
    log('Body: ${body.toString()}');
    http.Response response = await http.put(
      Uri.parse(_uriBuilder(path: path, query: query)),
      headers: _headersBuilder(headers),
      body: jsonEncode(body),
    );
    return returnResponse(response);
  }

  Future<AppResponse> delete({
    required String path,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  }) async {
    log('Request: DELETE');
    http.Response response = await http.delete(
      Uri.parse(_uriBuilder(path: path, query: query)),
      headers: _headersBuilder(headers),
    );
    return returnResponse(response);
  }

  Map<String, String> _headersBuilder(Map<String, String>? headers) {
    Map<String, String> allHeaders = {};
    allHeaders[HttpHeaders.acceptHeader] = 'application/json';
    allHeaders[HttpHeaders.contentTypeHeader] = 'application/json';
    allHeaders[HttpHeaders.connectionHeader] = 'Keep-alive';

    if (headers != null) {
      headers.forEach((key, value) => allHeaders[key] = value);
    }

    return allHeaders;
  }

  String _uriBuilder({
    required String path,
    required Map<String, dynamic>? query,
  }) {
    String url = '$urlServer$path';
    if (query != null) {
      if (query.isNotEmpty) {
        url += '?';
      }
      query.forEach((key, value) {
        url += '$key=$value&';
      });
    }
    log('URL: $url');
    return url;
  }

  AppResponse returnResponse(http.Response response) {
    AppResponse appResponse = AppResponse(
      statusCode: response.statusCode,
      headers: response.headers,
      body: response.body,
    );
    if (appResponse.isSuccess) {
      log('Exito');
    } else {
      log('Error: ${appResponse.statusCode}');
    }
    log(appResponse.body);
    return appResponse;
  }
}
