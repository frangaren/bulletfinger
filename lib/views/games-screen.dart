import 'package:flutter/material.dart';
import 'package:bulletfinger/models/profile.dart';
import 'package:bulletfinger/models/game.dart';
import 'package:bulletfinger/views/drawer.dart';
import 'package:bulletfinger/views/my-games.dart';

class GamesScreen extends StatelessWidget{
  final Profile profile;
  final List<Game> playerGames;
  final List<Game> games;

  GamesScreen(this.profile, this.games, this.playerGames, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 2,
      child: new Scaffold(
        drawer: new MyDrawer(
          profile,
          selectedOption: '/games',
        ),
        appBar: new AppBar(
          title: new Text('Partidas'),
          bottom: new TabBar(
            tabs: [
              new Tab(text: 'Mis partidas'),
              new Tab(text: 'Buscar'),
            ]
          ),
        ),
        body: new TabBarView(
          children: [
            new MyGames(playerGames),
            new Text('Buscar'),
          ]
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: () {},
          tooltip: 'Crear partida',
          child: new Icon(Icons.add),
        ),
      ),
    );
  }

}