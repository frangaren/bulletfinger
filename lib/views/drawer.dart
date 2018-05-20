import 'package:flutter/material.dart';
import 'package:bulletfinger/views/profile-header.dart';
import 'package:bulletfinger/models/profile.dart';

class MyDrawer extends StatelessWidget {

  MyDrawer({Key key, this.selectedOption}) : super(key: key);

  final String selectedOption;

  Widget build_entry(BuildContext context, {String route, String name,
    IconData icon}) {
    if (this.selectedOption == route) {
      return new ListTile(
        leading: new Icon(
            icon,
            color: Color(0xFF1775D1)
        ),
        title: new Text(
          name,
          style: new TextStyle(
            color: Color(0xFF1775D1),
          ),
        ),
        onTap: () {
          Navigator.pushNamed(context, route);
        },
      );
    } else {
      return new ListTile(
        leading: new Icon(icon),
        title: new Text(name),
        onTap: () {
          Navigator.pushNamed(context, route);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: new ListView(
        children: <Widget>[
          new ProfileHeader(new Profile(
              'frangaren',
              'frangaren@mail.something',
              '111222333'
          )),
          build_entry(
              context,
              route: '/home',
              name: 'Principal',
              icon: Icons.home
          ),
          build_entry(
              context,
              route: '/games',
              name: 'Partidas',
              icon: Icons.games
          ),
          build_entry(
              context,
              route: '/gallery',
              name: 'Galería',
              icon: Icons.video_library
          ),
          build_entry(
              context,
              route: '/friends',
              name: 'Amigos',
              icon: Icons.contacts
          ),
          build_entry(
              context,
              route: '/statistics',
              name: 'Estadísticas',
              icon: Icons.show_chart
          ),
          new Divider(),
          build_entry(
              context,
              route: '/help',
              name: 'Ayuda',
              icon: Icons.help
          ),
        ],
      ),
    );
  }

}