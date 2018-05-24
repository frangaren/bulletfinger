import 'dart:async';

import 'package:flutter/material.dart';
import 'package:bulletfinger/models/profile.dart';
import 'package:bulletfinger/views/friend.dart';

class FriendList extends StatefulWidget {
  final List<Profile> friends;
  final GlobalKey<ScaffoldState> scaffoldKey;

  FriendList(this.scaffoldKey, this.friends, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new FriendListState(scaffoldKey, friends);
  }
}

class FriendListState extends State<FriendList> {
  final List<Profile> friends;
  final GlobalKey<ScaffoldState> scaffoldKey;

  FriendListState(this.scaffoldKey, this.friends);

  Future addFriend(BuildContext context) async {
    TextEditingController controller = new TextEditingController();
    Profile friend = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('¿A quién quieres añadir como amigo?'),
          content: new TextField(
            controller: controller,
            decoration: new InputDecoration(
              hintText: 'Nombre',
            ),
          ),
          actions: <Widget>[
            new FlatButton(
              onPressed: () => Navigator.pop(context),
              child: new Text('CANCELAR'),
            ),
            new FlatButton(
              onPressed: () {
                Navigator.of(context).pop(new Profile(
                    controller.text,
                    controller.text + '@mail.com',
                    '111222333'
                ));
              },
              child: new Text('AÑADIR'),
            ),
          ],
        );
      },
    );
    if (friend != null) {
      if (mounted) {
        setState(() {
          this.friends.add(friend);
        });
      } else {
        this.friends.add(friend);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> friendWidgets = new List();
    friends.forEach((profile) {
      friendWidgets.add(new Friend(
        profile,
        onDelete: (friend) {
          setState(() {
            friends.remove(friend);
          });
        },
      ));
    });
    return new ListView(
      children: friendWidgets,
    );
  }
}