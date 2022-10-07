import 'package:flutter/material.dart';
import 'package:flutter_todo/repository/edit_repository.dart';
import '../models/user_model.dart';


class EditController {
  final User user;
  final TextEditingController nameController;
  final TextEditingController passwordController;
  final TextEditingController emailController;
  final TextEditingController usernameController;
  final EditRepository editRepository;

  EditController({required this.user,required this.nameController, required this.passwordController, required this.emailController, required this.usernameController, required this.editRepository}){
    nameController.text = user.name;
    passwordController.text = user.password;
    emailController.text = user.email;
    usernameController.text = user.username;
  }


  Future<bool> update(id) async{
    try {
      User newuser = User(id: id, name: nameController.text, password: passwordController.text, email: emailController.text, username: usernameController.text, created_on: '');
      var resgisterResponse = await editRepository.update(newuser);
      
      return true;
    } catch (e) {
      return false;
      
    }
  }




}