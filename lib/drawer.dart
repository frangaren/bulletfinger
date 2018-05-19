import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {

  MyDrawer({Key key, this.selectedOption}) : super(key: key);

  final String selectedOption;

  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: new Text('Hello World!'),
    );
  }

}