import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sample_app/features/home/bloc/home_bloc.dart';

class CreateWordWidget extends StatefulWidget {
  @override
  _CreateWordWidgetState createState() => _CreateWordWidgetState();
}

class _CreateWordWidgetState extends State<CreateWordWidget> {
  final _textEnglishController = TextEditingController();
  final _textPolishController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Wrap(
              spacing: 8,
              runSpacing: 20,
              children: [
                Center(
                  child: Text(
                    "Add new word to learn",
                    style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                TextField(
                    controller: _textEnglishController,
                    decoration: InputDecoration(border: OutlineInputBorder(), hintText: "English word")),
                TextField(
                  controller: _textPolishController,
                  decoration: InputDecoration(border: OutlineInputBorder(), hintText: "Polish word"),
                  onSubmitted: (_) {
                    dispatchSubmit(_textEnglishController.text, _textPolishController.text, context);
                  },
                ),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                            margin: EdgeInsets.fromLTRB(0, 10, 5, 10),
                            child: RaisedButton(
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(fontSize: 14, color: Colors.white),
                                ),
                                color: Colors.blueAccent,
                                elevation: 4,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                                onPressed: () {
                                  dispatchCancel(context);
                                }))),
                    Expanded(
                        child: Container(
                            margin: EdgeInsets.fromLTRB(5, 10, 0, 10),
                            child: RaisedButton(
                                child: Text("Create", style: TextStyle(fontSize: 14, color: Colors.white)),
                                color: Colors.blueAccent,
                                elevation: 4,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                                onPressed: () {
                                  dispatchSubmit(_textEnglishController.text, _textPolishController.text, context);
                                })))
                  ],
                )
              ],
            )
          ],
        ));
  }

  void dispatchSubmit(String english, String polish, BuildContext context) {
    Navigator.of(context).pop();
    BlocProvider.of<HomeBloc>(context).add(HomeAddWordEvent(english, polish));
  }

  void dispatchCancel(BuildContext context) {
    BlocProvider.of<HomeBloc>(context).add(HomeCancelCreateDialogEvent());
    Navigator.of(context).pop();
  }
}
