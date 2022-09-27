import 'dart:convert';
import 'package:flutter_todo/service/http_service.dart';
import '../../models/user_model.dart';
import '../edit_repository.dart';

class EditRepositoryImp extends EditRepository{
  final HttpService httpService;

  EditRepositoryImp(this.httpService);

  @override
  Future<bool> update(User user) async {

    var response = await httpService.getClient().put(
      Uri.http('127.0.0.1:6000', 'users/${user.id}'),
      body: jsonEncode({"username":user.username, "name":user.name,  "password":user.password, "email":user.email})
    );

    print(response.body);

    return false;
  }


  
}

