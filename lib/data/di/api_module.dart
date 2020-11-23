import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

const FIREBASE_API = 'firebaseAPI';

@module
abstract class ApiModule{

  @singleton
  Dio get dio => Dio();

  @Named(FIREBASE_API)
  @singleton
  String get firebaseAPI => '';//provide by config
}