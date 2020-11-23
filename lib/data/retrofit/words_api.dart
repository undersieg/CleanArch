import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import 'package:sample_app/data/model/word_dto.dart';
import 'package:sample_app/data/di/api_module.dart';

part 'words_api.g.dart';

@singleton
@RestApi()
abstract class WordsApi {
  @factoryMethod
  factory WordsApi(Dio dio, {@Named(FIREBASE_API) String baseUrl}) = _WordsApi;

  @POST("/words.json")
  Future<WordDTO> addNewWord(@Body() WordDTO word);

  @GET("/words.json")
  Future<Map<String, WordDTO>> getWords();
}
