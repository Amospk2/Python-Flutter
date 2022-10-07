import 'package:dio/dio.dart';
import 'package:flutter_todo/service/dio_service.dart';

class DioServiceImp implements DioService{

  DioServiceImp._internal();
  static final DioServiceImp _singleton = DioServiceImp._internal();
  factory DioServiceImp() => _singleton;


  @override
  Dio getDio() {
    return Dio();
  }

}
