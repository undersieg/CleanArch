import 'package:json_annotation/json_annotation.dart';

import 'package:sample_app/domain/entities/word.dart';

part 'word_dto.g.dart';

@JsonSerializable()
class WordDTO extends Word{
  final String id;
  final String inEnglish;
  final String inPolish;

  WordDTO({this.id, this.inEnglish, this.inPolish});

  factory WordDTO.fromJson(Map<String, dynamic> json) => _$WordDTOFromJson(json);
  Map<String, dynamic> toJson() => _$WordDTOToJson(this);
}
