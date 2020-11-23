import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sample_app/features/home/bloc/home_bloc.dart';
import 'package:sample_app/features/home/widgets/all_words_widget.dart';
import 'package:sample_app/features/home/widgets/create_word_widget.dart';
import 'package:sample_app/features/home/widgets/home_floating_control.dart';

class HomeViewWidget extends StatefulWidget {
  @override
  _HomeViewWidgetState createState() => _HomeViewWidgetState();
}

class _HomeViewWidgetState extends State<HomeViewWidget> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HomeBloc>(context).add(HomeGetListEvent());
    return BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is HomeNewWordAddedState) {
            BlocProvider.of<HomeBloc>(context).add(HomeGetListEvent());
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text("Sample app!"),
          ),
          body: Column(
            children: [
              BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
                if (state is HomeInitialState) {
                  return Center(
                      child: Text(
                    "There is no words to learn!",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ));
                } else if (state is HomeLoadingState) {
                  return Expanded(child: Center(child: CircularProgressIndicator()));
                } else if (state is HomeLoadedState) {
                  return AllWordsWidget(state.words);
                } else {
                  return Text("State not recognized!");
                }
              })
            ],
          ),
          floatingActionButton: HomeFloatingButtonWidget(
            onClicked: () {
              showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                  builder: (buildContext) {
                    return CreateWordWidget();
                  });
            },
          ),
          // child: Icon(Icons.add)),
        ));
  }
}
