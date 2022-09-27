import '../models/user_model.dart';

abstract class EditRepository{
  Future<bool> update(User user);
}