import 'package:flutter/material.dart';
import 'package:bulletfinger/models/profile.dart';
import 'package:bulletfinger/views/profile-picture.dart';
import 'package:intl/intl.dart';

class Friend extends StatelessWidget {
  final Profile friend;
  final Function onDelete;

  Friend(this.friend, {Key key, this.onDelete}) : super(key: key);

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
      title: new Text(
          friend.name,
      ),
      subtitle: new Text(_lastGame()),
      trailing: new GestureDetector(
        child: new Icon(Icons.delete),
        onTap: () => onDelete(friend),
      )
    );
  }
}