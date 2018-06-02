import 'package:flutter/material.dart';
import 'package:bulletfinger/models/profile.dart';
import 'package:bulletfinger/models/game.dart';
import 'package:bulletfinger/views/drawer.dart';
import 'package:bulletfinger/views/my-games.dart';
import 'package:bulletfinger/views/search-games.dart';
import 'package:bulletfinger/views/create-game-screen.dart';

class GamesScreen extends StatefulWidget{
  final Profile profile;
  final List<Game> playerGames;
  final List<Game> games;

  GamesScreen(this.profile, this.games, this.playerGames, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new GamesScreenState(profile, games, playerGames);
  }

}

class GamesScreenState extends State<GamesScreen> {
  final Profile profile;
  final List<Game> playerGames;
  final List<Game> games;

  GamesScreenState(this.profile, this.games, this.playerGames);

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
              new SearchGames(playerGames, games)
            ]
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) {
                return new CreateGameScreen();
              },
            )).then((game) {
              setState((){
                games.add(game);
                playerGames.add(game);
              });
            });
          },
          tooltip: 'Crear partida',
          child: new Icon(Icons.add),
        ),
      ),
    );
  }
}