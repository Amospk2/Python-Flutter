

import 'dart:convert';

import 'package:flutter_todo/service/http_service.dart';

import '../../models/user_model.dart';
import '../register_repository.dart';

class RegisterRepositoryImp extends RegisterRepository{
  final HttpService httpService;

  RegisterRepositoryImp(this.httpService);

  @override
  Future<bool> register(User user) async {

    var response = await httpService.getClient().post(
      Uri.http('127.0.0.1:6000', 'users'),
      body: jsonEncode({"username":user.username, "name":user.name,  "password":user.password, "email":user.email})
    );

    print(response.body);

    return false;
  }


  
}

