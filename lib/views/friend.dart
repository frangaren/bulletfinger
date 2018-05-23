import 'package:flutter/material.dart';
import 'package:bulletfinger/models/profile.dart';
import 'package:bulletfinger/views/profile-picture.dart';
import 'package:intl/intl.dart';

class Friend extends StatelessWidget {
  final Profile friend;

  Friend(this.friend, {Key key, Function onDelete}) : super(key: key);

  String _lastGame() {
    DateTime date = friend.lastGame;
    DateFormat format = new DateFormat();
    return 'Última partida el ' + format.format(date);
  }

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      leading: new ProfilePicture(
          friend.image,
          false
      ),
      title: new Text(friend.name),
      subtitle: new Text(_lastGame()),
      trailing: new Icon(Icons.delete),
    );
  }
}