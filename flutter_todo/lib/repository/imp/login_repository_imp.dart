import 'dart:convert';
import 'package:flutter_todo/repository/login_repository.dart';
import '../../const.dart';
import '../../service/dio_service.dart';
import 'package:dio/dio.dart';

class LoginRepositoryImp extends LoginRepository{
  final DioService dioService;

  LoginRepositoryImp({required this.dioService});

  @override
  Future<Map<String, dynamic>> auth(String username, String password) async {


    var response = await dioService.getDio().post(
      'http://$baseurl/auth',
      data: jsonEncode({"username":username, "password":password})
    );
    return Map();
  }
  
}