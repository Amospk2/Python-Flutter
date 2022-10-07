// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_todo/models/user_model.dart';

import '../../const.dart';
import '../../service/dio_service.dart';
import '../home_repository.dart';



class HomeRepositoryImp extends HomeRepository {

  final DioService dioService;

  HomeRepositoryImp({
    required this.dioService,
  });



  @override
  Future<List<User>> fetch() async {
    var response = await dioService.getDio().get('http://$baseurl/users');

    List<dynamic> list = response.data['data'];

    return list.map((e)=>User.fromMap(e)).toList();
  }

  @override
  Future<void> deleteUser(id) async {
    var response = await dioService.getDio().delete('http://$baseurl/users/$id');
  }

}
