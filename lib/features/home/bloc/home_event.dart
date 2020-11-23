part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class HomeGetListEvent extends HomeEvent {}

class HomeDisplayCreateWordDialogEvent extends HomeEvent {}
class HomeCancelCreateDialogEvent extends HomeEvent {}

class HomeAddWordEvent extends HomeEvent {
  final String englishWord;
  final String polishWord;

  HomeAddWordEvent(this.englishWord, this.polishWord);

  @override
  List<Object> get props => [englishWord, polishWord];
}
