import 'package:flutter/material.dart';
import 'package:bulletfinger/models/profile.dart';
import 'package:bulletfinger/views/drawer.dart';

class HomeScreen extends StatelessWidget{
  final Profile profile;

  HomeScreen(this.profile, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: new MyDrawer(
        profile,
        selectedOption: '/home',
      ),
      appBar: new AppBar(
        title: new Text('Principal'),
      ),
      body: new Text('Hello world'),
    );
  }

}