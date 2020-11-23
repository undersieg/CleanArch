import 'package:dartz/dartz.dart';

import 'package:sample_app/domain/entities/word.dart';
import 'package:sample_app/core/error/failures.dart';

abstract class WordsRepository {
  Future<Either<Failure, List<Word>>> getEnglishWords();

  Future<Either<Failure, void>> addNewWords(String englishWord, String polishWord);
}
