import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:sample_app/core/base/use_case.dart';
import 'package:sample_app/core/error/failures.dart';
import 'package:sample_app/domain/repositories/words_repository.dart';

@injectable
class AddNewWordUseCase extends UseCase<void, Params> {
  final WordsRepository _wordsRepository;

  AddNewWordUseCase(this._wordsRepository);

  @override
  Future<Either<Failure, void>> call(Params params) {
    return _wordsRepository.addNewWords(params.englishWord, params.polishWord);
  }
}

class Params {
  final String englishWord;
  final String polishWord;

  Params(this.englishWord, this.polishWord);
}
