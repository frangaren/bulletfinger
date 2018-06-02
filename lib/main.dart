import 'package:flutter/material.dart';
import 'package:bulletfinger/views/loading-screen.dart';
import 'package:bulletfinger/views/detect-peripherals-screen.dart';
import 'package:bulletfinger/views/profile-screen.dart';
import 'package:bulletfinger/views/friend-list-screen.dart';
import 'package:bulletfinger/views/gallery-screen.dart';
import 'package:bulletfinger/views/statistics-screen.dart';
import 'package:bulletfinger/views/home-screen.dart';
import 'package:bulletfinger/views/games-screen.dart';
import 'package:bulletfinger/views/wait-player-screen.dart';
import 'package:bulletfinger/views/in-game-screen.dart';
import 'package:bulletfinger/models/model.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  final Model model = new Model.randomize();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'BulletFinger',
      routes: <String, WidgetBuilder> {
        '/' : (BuildContext context) => new LoadingScreen(),
        '/detect-peripherals':
            (BuildContext context) => new DetectPeripheralsScreen(),
        '/home' : (BuildContext context) => new HomeScreen(model.me, model.myGames),
        '/profile': (BuildContext context) => new ProfileScreen(model.me),
        '/friends': (BuildContext context) => new FriendListScreen(model.me, model.friends),
        '/gallery': (BuildContext context) => new Gallery(model.me, model.videos),
        '/statistics': (BuildContext context) => new StatisticsScreen(model.me, model.statistics),
        '/games': (BuildContext context) => new GamesScreen(model.me, model.games, model.myGames),
        '/wait_players': (BuildContext context) => new WaitPlayersScreen(),
        '/in_game': (BuildContext context) => new InGameScreen(),
      },
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primaryColor: Color(0xFF1775D1),
        accentColor: Color(0xFFFBC02D),
        buttonColor: Color(0xFFFBC02D),
        disabledColor: Color(0xFFC49000),
      ),
    );
  }
}