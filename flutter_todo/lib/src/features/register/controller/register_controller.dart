


import 'package:flutter/foundation.dart';

import '../../../../const.dart';
import '../../../shared/services/client.dart';

enum APIResponseType { sucess, error, loading, idle }

class RegisterController extends ChangeNotifier{
  Map<String, dynamic> createUserInputs = {
    "username": "",
    "password": "",
    "name": "",
    "email": ""
  };

  APIResponseType state = APIResponseType.idle;
  String responseMSG = "Sucess";
  final ClientAPI client;

  
  RegisterController({required this.client});

    Future<void> create() async {
    state = APIResponseType.loading;
    notifyListeners();

    try {
      var response =
          await client.post('http://${baseurl}//users', createUserInputs);
          
      responseMSG = response["message"];
      state = APIResponseType.sucess;
      notifyListeners();
    } catch (e) {
      state = APIResponseType.error;
      notifyListeners();
    }
  }

  
}