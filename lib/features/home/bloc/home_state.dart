part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {
  @override
  List<Object> get props => [];
}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeNewWordAddedState extends HomeState {}

class HomeLoadedState extends HomeState {
  final List<Word> words;

  HomeLoadedState(this.words);

  @override
  List<Object> get props => [words];
}

class HomeDisplayCreateWordState extends HomeState {}

class HomeErrorState extends HomeState {}
