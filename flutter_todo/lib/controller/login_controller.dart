import 'package:flutter/material.dart';
import '../repository/imp/login_repository_imp.dart';



class LoginController{
  final TextEditingController nomeController;
  final TextEditingController senhaController;
  final LoginRepositoryImp loginRepositoryImp;
  LoginController({required this.nomeController, required this.senhaController, required this.loginRepositoryImp});

  Future<bool> auth() async{
    var authResponse = await loginRepositoryImp.auth(nomeController.text, senhaController.text);
    
    if (authResponse.containsKey('token'))
      return true;
    else
      return false;
  }


}