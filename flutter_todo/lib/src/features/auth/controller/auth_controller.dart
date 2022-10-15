import 'package:flutter/material.dart';
import 'package:flutter_todo/src/shared/services/client.dart';
import '../../../../const.dart';

enum AuthState { idle, sucess, error, loading }

class AuthController extends ChangeNotifier {
  Map<String, dynamic> authInputs = {"username": "", "password": ""};
  final ClientAPI client;

  AuthController({required this.client});

  var state = AuthState.idle;

  Future<void> auth() async {
    state = AuthState.loading;
    notifyListeners();

    try {
      var authResponse = await client.post('http://$baseurl/auth', authInputs);
      if(authResponse["message"] == "Validated successfully"){
        
        state = AuthState.sucess;
        notifyListeners();
      } else {
        state = AuthState.error;
        notifyListeners();
      }
    } catch (e) {
      state = AuthState.error;
      notifyListeners();
    }
  }
}
