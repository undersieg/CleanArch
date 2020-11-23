import 'package:flutter/material.dart';

class LanguageWordWidget extends StatelessWidget {
  final String language;
  final String value;

  LanguageWordWidget(this.language, this.value);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
            child: Text(
          language,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
        )),
        Center(
            child: Text(
          value,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 30),
        ))
      ],
    );
  }
}
