import 'dart:convert';
import 'package:flutter_todo/service/dio_service.dart';
import '../../const.dart';
import '../../models/user_model.dart';
import '../edit_repository.dart';

class EditRepositoryImp extends EditRepository{
  final DioService dioService;

  EditRepositoryImp(this.dioService);

  @override
  Future<bool> update(User user) async {

    var response = await dioService.getDio().put(
      'http://${baseurl}//users/${user.id}',
      data: jsonEncode({"username":user.username, "name":user.name,  "password":user.password, "email":user.email})
    );

    return false;
  }


  
}

