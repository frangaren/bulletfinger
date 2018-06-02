import 'package:flutter/material.dart';
import 'package:bulletfinger/models/game.dart';

class ViewGameScreen extends StatelessWidget {
  final Game game;
  final List<Game> playerGames;

  ViewGameScreen(this.game, this.playerGames);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Principal'),
      ),
      body: new Text('Hello'),
    );
  }
}
