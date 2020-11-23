import 'package:flutter/material.dart';

import 'package:sample_app/domain/entities/word.dart';
import 'package:sample_app/features/home/widgets/word_card_widget.dart';

class AllWordsWidget extends StatefulWidget {
  final List<Word> _words;

  AllWordsWidget(this._words);

  @override
  _AllWordsWidgetState createState() => _AllWordsWidgetState();
}

class _AllWordsWidgetState extends State<AllWordsWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      itemBuilder: (buildContext, index) {
        return WordCardWidget(widget._words[index]);
      },
      itemCount: widget._words.length,
    ));
  }
}
