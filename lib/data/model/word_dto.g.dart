// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WordDTO _$WordDTOFromJson(Map<String, dynamic> json) {
  return WordDTO(
    id: json['id'] as String,
    inEnglish: json['inEnglish'] as String,
    inPolish: json['inPolish'] as String,
  );
}

Map<String, dynamic> _$WordDTOToJson(WordDTO instance) => <String, dynamic>{
      'id': instance.id,
      'inEnglish': instance.inEnglish,
      'inPolish': instance.inPolish,
    };
