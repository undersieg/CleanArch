import 'package:equatable/equatable.dart';

class Word extends Equatable {
  final String id;
  final String inEnglish;
  final String inPolish;

  const Word({this.id, this.inEnglish, this.inPolish});

  @override
  List<Object> get props => [id, inEnglish, inPolish];
}
