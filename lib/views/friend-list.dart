import 'package:flutter/material.dart';
import 'package:bulletfinger/models/profile.dart';
import 'package:bulletfinger/views/friend.dart';

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
    List<Widget> friendWidgets = new List();
    friends.forEach((profile) {
      friendWidgets.add(new Friend(profile));
    });
    return new ListView(
      children: friendWidgets,
    );
  }
}