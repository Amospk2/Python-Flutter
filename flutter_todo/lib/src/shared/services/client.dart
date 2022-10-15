abstract class ClientAPI
{
  Future<Map<dynamic, dynamic>> post(String url, Map<String, dynamic>? data);
  Future<Map<String, dynamic>> get(String url);
  Future<Map<String, dynamic>> delete(String url);
  Future<Map<String, dynamic>> put(String url, Map<String, dynamic>? data);
    
}