import 'package:flutter/material.dart';

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
        ],
      ),
    );
  }

}