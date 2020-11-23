// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'words_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _WordsApi implements WordsApi {
  _WordsApi(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<WordDTO> addNewWord(word) async {
    ArgumentError.checkNotNull(word, 'word');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(word?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>('/words.json',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = WordDTO.fromJson(_result.data);
    return value;
  }

  @override
  Future<Map<String, WordDTO>> getWords() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/words.json',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data.map((k, dynamic v) =>
        MapEntry(k, WordDTO.fromJson(v as Map<String, dynamic>)));

    return value;
  }
}
