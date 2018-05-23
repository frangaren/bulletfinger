import 'package:flutter/material.dart';
import 'package:bulletfinger/models/profile.dart';
import 'package:bulletfinger/views/profile-picture.dart';

class Friend extends StatelessWidget {
  final Profile friend;

  Friend(this.friend, {Key key, Function onDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      leading: new ProfilePicture(
          friend.image,
          false
      ),
      title: new Text(friend.name),
    );
  }
}