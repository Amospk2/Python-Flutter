/* import 'dart:convert';
import 'package:dio/dio.dart';

class AuthRepositoryImp extends AuthRepository{
  final DioService dioService;

  AuthRepositoryImp({required this.dioService});

  @override
  Future<Map<String, dynamic>> auth(String username, String password) async {

    var response = await dioService.getDio().post(
      'http://$baseurl/auth',
      data: jsonEncode({"username":username, "password":password})
    );
    return Map();
  }
  
} */