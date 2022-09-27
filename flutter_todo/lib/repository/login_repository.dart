
abstract class LoginRepository{
  Future<Map<String, dynamic>> auth(String username, String password);
}