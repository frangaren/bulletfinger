import 'package:flutter/material.dart';
import 'package:bulletfinger/models/profile.dart';
import 'package:bulletfinger/views/drawer.dart';

class FriendList extends StatefulWidget {
  final List<Profile> friends;

  FriendList(this.friends, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new FriendListState(friends);
  }
}

class FriendListState extends State<FriendList> {
  final List<Profile> friends;

  FriendListState(this.friends);

  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: <Widget>[
        new ListTile(
          title: new Text('Placeholder'),
        )
      ],
    );
  }
}