import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:sample_app/core/error/failures.dart';
import 'package:sample_app/data/datasource/words_remote_data_source.dart';
import 'package:sample_app/domain/entities/word.dart';
import 'package:sample_app/domain/repositories/words_repository.dart';

@Injectable(as: WordsRepository)
class WordsRepositoryImpl extends WordsRepository {
  final WordsRemoteDataSource _wordsRemoteDataSource;

  WordsRepositoryImpl(this._wordsRemoteDataSource);

  @override
  Future<Either<Failure, List<Word>>> getEnglishWords() async {
    try {
      final result = await _wordsRemoteDataSource.getEnglishWordList();
      return Right(result);
    } catch (e) {
      return Left(ServerError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addNewWords(String englishWord, String polishWord) async {
    try {
      return Right(await _wordsRemoteDataSource.addNewWord(englishWord, polishWord));
    } catch (e) {
      return Left(ServerError(message: e.toString()));
    }
  }
}
