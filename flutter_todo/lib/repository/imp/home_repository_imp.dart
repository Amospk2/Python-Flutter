// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_todo/models/user_model.dart';

import '../../service/http_service.dart';
import '../home_repository.dart';



class HomeRepositoryImp extends HomeRepository {

  late HttpService httpService;

  HomeRepositoryImp({
    required this.httpService,
  });



  @override
  Future<List<User>> fetch() async {
    var url = Uri.http('127.0.0.1:6000', 'users');
    var response = await httpService.getClient().get(url);

    List<dynamic> list = (jsonDecode(response.body)['data']);

    return list.map((e)=>User.fromMap(e)).toList();
  }

  @override
  Future<void> deleteUser(id) async {
    var url = Uri.http('127.0.0.1:6000', '/users/$id');
    var response = await httpService.getClient().delete(url);

  }

}
