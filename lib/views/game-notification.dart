import 'package:flutter/material.dart';
import 'package:bulletfinger/views/view-game-screen.dart';
import 'package:bulletfinger/models/game.dart';

class GameNotification extends StatelessWidget {
  final Game game;
  final List<Game> playerGames;

  GameNotification(this.game, this.playerGames);

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Padding(
        padding: new EdgeInsets.all(8.0),
        child: new Column(
          children: <Widget>[
            new Text(
              'Una de tus partidas va a comenzar. Acercate a la localización y presiona empezar.',
              style: new TextStyle(
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
            new Padding(
              padding: new EdgeInsets.only(top: 8.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  new FlatButton(
                    onPressed: () {
                      Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) {
                          return new ViewGameScreen(game, playerGames);
                        },
                      ));
                    },
                    child: new Text(
                      'VER PARTIDA',
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ),
                  new FlatButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/wait_players');
                    },
                    child: new Text(
                      'EMPEZAR',
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      color: Theme.of(context).primaryColor,
    );
  }
}
