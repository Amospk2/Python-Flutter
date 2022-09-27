import 'package:flutter_todo/service/http_service.dart';
import 'package:http/http.dart' as http;

class HttpServiceImp extends HttpService{
  @override
  http.Client getClient() {

    return http.Client();
  }

}