import 'package:flutter/material.dart';
import 'package:flutter_todo/models/user_model.dart';
import '../repository/home_repository.dart';

class HomeController{

  final HomeRepository homeRepository;
  ValueNotifier<List<User>>? users = ValueNotifier<List<User>>([]);
  

  HomeController(this.homeRepository)
  {
    fetch();
  }

  void fetch() async{
    try{
      users!.value = await homeRepository.fetch();
    }catch(e){
      print(e);
    }
  }

  void deleteUser(int id) async {
    await homeRepository.deleteUser(id);
    fetch();
  }
}