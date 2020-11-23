import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:sample_app/core/base/use_case.dart';
import 'package:sample_app/core/error/failures.dart';
import 'package:sample_app/domain/repositories/words_repository.dart';
import 'package:sample_app/domain/entities/word.dart';

@injectable
class GetEnglishWordListUseCase extends UseCase<List<Word>, NoParams> {
  final WordsRepository _wordsRepository;

  GetEnglishWordListUseCase(this._wordsRepository);

  @override
  Future<Either<Failure, List<Word>>> call(NoParams noParams) {
    return _wordsRepository.getEnglishWords();
  }
}
