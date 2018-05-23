import 'package:flutter/material.dart';
import 'package:bulletfinger/models/profile.dart';
import 'package:bulletfinger/views/drawer.dart';
import 'package:bulletfinger/views/friend-list.dart';

class FriendListScreen extends StatelessWidget {
  final Profile profile;
  final List<Profile> friends;

  FriendListScreen(this.profile, this.friends, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: new MyDrawer(
        profile,
        selectedOption: '/friends',
      ),
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text('Amigos'),
      ),
      body: new Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: new FriendList(friends),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: null,
        tooltip: 'Añadir amigo',
        child: new Icon(Icons.person_add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}