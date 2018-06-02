import 'package:flutter/material.dart';
import 'package:bulletfinger/models/game.dart' as model;
import 'package:bulletfinger/views/view-game-screen.dart';

class Game extends StatelessWidget{
  final model.Game game;
  final List<model.Game> playerGames;
  final Function onUpdate;

  Game(this.game, this.playerGames, {this.onUpdate, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      title: new Text(
        game.locationName,
      ),
      subtitle: new Text(game.dateTimeString),
      onTap: () {
        Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) {
            return new ViewGameScreen(game, playerGames);
          },
        )).then((_) {
          if (onUpdate != null) onUpdate();
        });
      },
    );
  }

}