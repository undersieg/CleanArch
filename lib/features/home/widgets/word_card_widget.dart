import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

import 'package:sample_app/features/home/widgets/language_word_widget.dart';
import 'package:sample_app/domain/entities/word.dart';

class WordCardWidget extends StatefulWidget {
  final Word _word;

  WordCardWidget(this._word);

  @override
  _WordCardWidgetState createState() => _WordCardWidgetState();
}

class _WordCardWidgetState extends State<WordCardWidget> {
  bool _isEnglish = true;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: _isEnglish ? Colors.blue : Colors.green,
        margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        elevation: 4,
        child: Container(
            padding: EdgeInsets.all(30),
            child: FlipCard(
              direction: FlipDirection.HORIZONTAL,
              onFlip: () {
                setState(() {
                  _isEnglish = !_isEnglish;
                });
              },
              front: LanguageWordWidget("English:", widget._word.inEnglish),
              back: LanguageWordWidget("Polish:", widget._word.inPolish),
            )));
  }
}
