import 'package:injectable/injectable.dart';

import 'package:sample_app/data/retrofit/words_api.dart';
import 'package:sample_app/data/model/word_dto.dart';

abstract class WordsRemoteDataSource {
  Future<List<WordDTO>> getEnglishWordList();

  Future<void> addNewWord(String englishWord, String polishWord);
}

@Injectable(as: WordsRemoteDataSource)
class WordsRemoteDataSourceImpl extends WordsRemoteDataSource {
  final WordsApi _wordsApi;

  WordsRemoteDataSourceImpl(this._wordsApi);

  @override
  Future<List<WordDTO>> getEnglishWordList() async {
    final result = await _wordsApi.getWords();
    return result.entries
        .map((entry) => WordDTO(id: entry.key, inEnglish: entry.value.inEnglish, inPolish: entry.value.inPolish))
        .toList();
  }

  @override
  Future<void> addNewWord(String englishWord, String polishWord) {
    return _wordsApi.addNewWord(WordDTO(inEnglish: englishWord, inPolish: polishWord));
  }
}
