import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {

  MyDrawer({Key key, this.selectedOption}) : super(key: key);

  final String selectedOption;

  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: new ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: new Text('Francisco'),
            accountEmail: new Text('frangaren@usal.es'),
            currentAccountPicture: new Container(
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: new AssetImage('assets/blank-profile.png'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}