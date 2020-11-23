import 'package:flutter/material.dart';

class HomeFloatingButtonWidget extends StatefulWidget {
  final Function() onClicked;

  HomeFloatingButtonWidget({this.onClicked});

  @override
  _HomeFloatingButtonWidgetState createState() => _HomeFloatingButtonWidgetState();
}

class _HomeFloatingButtonWidgetState extends State<HomeFloatingButtonWidget> {
  @override
  FloatingActionButton build(BuildContext context) {
    return FloatingActionButton(
        onPressed: this.widget.onClicked, backgroundColor: Colors.orange, child: Icon(Icons.add));
  }
}
