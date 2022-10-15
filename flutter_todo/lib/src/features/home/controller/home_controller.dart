import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import '../../../../const.dart';
import '../../../shared/services/client.dart';
import '../models/user_model.dart';

enum APIResponseType { sucess, error, loading, idle }

class HomeController extends ChangeNotifier {
  Map<String, dynamic> editUserInputs = {
    "username": "",
    "password": "",
    "name": "",
    "email": ""
  };
  List<User> users = [];

  final ClientAPI client;

  APIResponseType state = APIResponseType.idle;

  HomeController({required this.client});

  Future<void> update(id) async {
    state = APIResponseType.loading;
    notifyListeners();

    try {
      var response =
          await client.put('http://${baseurl}//users/${id}', editUserInputs);

      await fetch();
      state = APIResponseType.sucess;
      notifyListeners();
    } catch (e) {
      state = APIResponseType.error;
      notifyListeners();
    }
  }

  @override
  Future<void> fetch() async {
    try {
      var response = await client.get('http://$baseurl/users');
      List<dynamic> list = response['data'];
      users = list.map((e) => User.fromMap(e)).toList();
      state = APIResponseType.idle;
      notifyListeners();
    } catch (e) {
      state = APIResponseType.error;
      notifyListeners();
    }
  }

  Future<void> deleteUser(id) async {
    try {
      var response = await client.delete('http://$baseurl/users/$id');
      fetch();
    } catch (e) {
      print(e.toString());
    }
  }
}
