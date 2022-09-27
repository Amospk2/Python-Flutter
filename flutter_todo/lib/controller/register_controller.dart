

import 'package:flutter/material.dart';

import '../models/user_model.dart';
import '../repository/imp/register_repository_imp.dart';
import '../repository/register_repository.dart';


class RegisterController {
  final TextEditingController nameController;
  final TextEditingController passwordController;
  final TextEditingController emailController;
  final TextEditingController usernameController;
  final RegisterRepository registerRepository;

  RegisterController({required this.nameController, required this.passwordController, required this.emailController, required this.usernameController, required this.registerRepository});


  Future<bool> register() async{
    User newuser = User(id: 0, name: nameController.text, password: passwordController.text, email: emailController.text, username: usernameController.text, created_on: '');
    var resgisterResponse = await registerRepository.register(newuser);
    
    return true;
  }




}