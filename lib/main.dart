import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sample_app/di/di.dart';
import 'package:sample_app/features/home/bloc/home_bloc.dart';
import 'package:sample_app/features/home/views/home_view.dart';

void main() {
  initDependencies('dev');
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(create: (_) => getIt<HomeBloc>()),
      ],
      child: MaterialApp(
          theme: ThemeData(
              appBarTheme: AppBarTheme(
                  elevation: 4.0,
                  centerTitle: true,
                  textTheme: TextTheme(
                      headline1: TextStyle(color: Colors.white, fontSize: 16),
                      headline2: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 10),
                      headline3: TextStyle(color: Colors.green, fontSize: 10)))),
          home: HomeViewWidget())));
}
