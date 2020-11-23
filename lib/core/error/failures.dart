import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class ServerError extends Failure {
  final String message;

  ServerError({this.message});
}

class CacheError extends Failure {}

class UnknownError extends Failure {}
