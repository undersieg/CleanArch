import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import 'package:sample_app/core/base/use_case.dart';
import 'package:sample_app/domain/entities/word.dart';
import 'package:sample_app/domain/usecases/add_new_word_use_case.dart';
import 'package:sample_app/domain/usecases/get_english_word_list_use_case.dart';

part 'home_event.dart';

part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetEnglishWordListUseCase _getEnglishWordListUseCase;
  final AddNewWordUseCase _addNewWordUseCase;

  HomeBloc(this._getEnglishWordListUseCase, this._addNewWordUseCase) : super(HomeInitialState());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event,) async* {
    if (event is HomeGetListEvent) {
      yield HomeLoadingState();
      yield* getNewList();
    } else if (event is HomeAddWordEvent) {
      final result = await _addNewWordUseCase(Params(event.englishWord, event.polishWord));
      yield result.fold((error) => HomeErrorState(), (result) => HomeNewWordAddedState());
    } else if (event is HomeDisplayCreateWordDialogEvent) {
    yield HomeDisplayCreateWordState();
    }
  }

  Stream<HomeState> getNewList() async* {
    final words = await _getEnglishWordListUseCase(NoParams());
    yield words.fold((error) => HomeErrorState(), (result) => HomeLoadedState(result));
  }
}
