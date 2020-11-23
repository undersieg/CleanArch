// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../domain/usecases/add_new_word_use_case.dart';
import '../data/di/api_module.dart';
import '../domain/usecases/get_english_word_list_use_case.dart';
import '../features/home/bloc/home_bloc.dart';
import '../data/retrofit/words_api.dart';
import '../data/datasource/words_remote_data_source.dart';
import '../domain/repositories/words_repository.dart';
import '../data/repositories/words_repository_impl.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final apiModule = _$ApiModule();
  gh.factory<WordsRemoteDataSource>(
      () => WordsRemoteDataSourceImpl(get<WordsApi>()));
  gh.factory<WordsRepository>(
      () => WordsRepositoryImpl(get<WordsRemoteDataSource>()));
  gh.factory<AddNewWordUseCase>(
      () => AddNewWordUseCase(get<WordsRepository>()));
  gh.factory<GetEnglishWordListUseCase>(
      () => GetEnglishWordListUseCase(get<WordsRepository>()));
  gh.factory<HomeBloc>(() =>
      HomeBloc(get<GetEnglishWordListUseCase>(), get<AddNewWordUseCase>()));

  // Eager singletons must be registered in the right order
  gh.singleton<Dio>(apiModule.dio);
  gh.singleton<String>(apiModule.firebaseAPI, instanceName: 'firebaseAPI');
  gh.singleton<WordsApi>(
      WordsApi(get<Dio>(), baseUrl: get<String>(instanceName: 'firebaseAPI')));
  return get;
}

class _$ApiModule extends ApiModule {}
