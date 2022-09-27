

import '../models/user_model.dart';

abstract class HomeRepository{

  Future<List<User>> fetch();

  Future<void> deleteUser(id);


}