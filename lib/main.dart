import 'package:bulletfinger/models/profile.dart';
import 'package:flutter/material.dart';
import 'package:bulletfinger/views/loading-screen.dart';
import 'package:bulletfinger/views/detect-peripherals-screen.dart';
import 'package:bulletfinger/views/profile-screen.dart';
import 'package:bulletfinger/views/friend-list-screen.dart';
import 'package:bulletfinger/views/gallery-screen.dart';
import 'package:bulletfinger/views/statistics-screen.dart';
import 'package:bulletfinger/views/home-screen.dart';
import 'package:bulletfinger/models/video.dart';
import 'package:bulletfinger/models/statistics.dart';
import 'package:bulletfinger/models/game.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final Profile profile = new Profile(
      'frangaren',
      'frangaren@mail.something',
      '111222333'
  );

  final List<Profile> friends = <Profile>[
    new Profile(
        'friend',
        'friend@gmail.com',
        '111222333'
    ),
  ];

  final List<Video> videos = <Video>[
    new Video(
        'Prueba 1'
    ),
    new Video(
        'Prueba 2'
    ),
    new Video(
        'Prueba 3'
    ),
  ];

  final Statistics statistics = Statistics.randomize();

  final List<Game> games = <Game> [
    new Game(new DateTime.now()),
  ];

  final List<Game> playerGames = <Game> [
    new Game(new DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'BulletFinger',
      routes: <String, WidgetBuilder> {
        '/' : (BuildContext context) => new LoadingScreen(),
        '/detect-peripherals':
            (BuildContext context) => new DetectPeripheralsScreen(),
        '/home' : (BuildContext context) => new HomeScreen(profile, playerGames),
        '/profile': (BuildContext context) => new ProfileScreen(profile),
        '/friends': (BuildContext context) => new FriendListScreen(profile, friends),
        '/gallery': (BuildContext context) => new Gallery(profile, videos),
        '/statistics': (BuildContext context) => new StatisticsScreen(profile, statistics),
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