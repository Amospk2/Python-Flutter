import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_todo/src/shared/services/client.dart';

class ClientDio implements ClientAPI {
  final dio = Dio();

  @override
  Future<Map<String, dynamic>> get(String url) async {
    final response = await dio.get(url);
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> put(String url, Map<String, dynamic>? data) async {
    final response = await dio.put(url, data: jsonEncode(data));
    return response.data;
  }

  @override
  Future<Map<dynamic, dynamic>> post(String url, Map<String, dynamic>? data) async {
    var response = await dio.post(url, data: jsonEncode(data));

    return response.data;
  }
  
  @override
  Future<Map<String, dynamic>> delete(String url) async {
    final response = await dio.delete(url);
    return response.data;

  }
}
