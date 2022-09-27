import '../models/user_model.dart';

abstract class RegisterRepository{
  Future<bool> register(User user);
}