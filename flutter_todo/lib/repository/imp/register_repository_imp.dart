

import 'dart:convert';


import '../../const.dart';
import '../../models/user_model.dart';
import '../../service/dio_service.dart';
import '../register_repository.dart';

class RegisterRepositoryImp extends RegisterRepository{
  final DioService dioService;

  RegisterRepositoryImp(this.dioService);

  @override
  Future<bool> register(User user) async {
    
    var response = await dioService.getDio().post(
      'http://$baseurl/users',
      data: jsonEncode({"username":user.username, "name":user.name,  "password":user.password, "email":user.email})
    );

    return true;
  }


  
}

