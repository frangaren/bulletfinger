import 'package:flutter/material.dart';
import 'package:bulletfinger/models/game.dart' as model;
import 'package:bulletfinger/views/game.dart';

class MyGames extends StatefulWidget{
  final List<model.Game> playerGames;

  MyGames(this.playerGames, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new MyGamesState(playerGames);
  }
}

class MyGamesState extends State<MyGames> {
  final List<model.Game> playerGames;

  MyGamesState(this.playerGames);

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: new EdgeInsets.symmetric(horizontal: 16.0),
      child: new ListView(
        children: new List.generate(playerGames.length, (index) {
          return new Game(playerGames[index], playerGames, onUpdate: () => setState((){}),);
        }),
      ),
    );
  }
}