import 'dart:convert';

import 'package:flutter_todo/repository/login_repository.dart';
import '../../service/http_service.dart';
class LoginRepositoryImp extends LoginRepository{
  final HttpService httpService;

  LoginRepositoryImp({required this.httpService});

  @override
  Future<Map<String, dynamic>> auth(String username, String password) async {

    var response = await httpService.getClient().post(
      Uri.http('127.0.0.1:6000', 'auth'),
      body: jsonEncode({"username":username, "password":password})
    );

    return jsonDecode(response.body);
  }
  
}