import 'package:flutter/material.dart';
import 'package:bulletfinger/models/profile.dart';
import 'package:bulletfinger/models/game.dart';
import 'package:bulletfinger/views/drawer.dart';
import 'package:bulletfinger/views/game-notification.dart';

class HomeScreen extends StatelessWidget{
  final Profile profile;
  final List<Game> playerGames;

  HomeScreen(this.profile, this.playerGames, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> notifications = new List();
    playerGames.forEach((Game game) {
      if (game.isAboutToStart()) {
        notifications.add(new GameNotification(game, playerGames));
      }
    });
    return new Scaffold(
      drawer: new MyDrawer(
        profile,
        selectedOption: '/home',
      ),
      appBar: new AppBar(
        title: new Text('Principal'),
      ),
      body: new Padding(
        padding: new EdgeInsets.all(16.0),
        child: new Column(
          children: <Widget>[
            new Column(
              children: notifications,
            ),
            new Card(
              child: new Column(
                children: <Widget>[
                  new AspectRatio(
                      aspectRatio: 1.7778,
                    child: new Container(
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Padding(
                            padding: new EdgeInsets.all(8.0),
                            child: new Text(
                              'BulletFinger en Android',
                              style: new TextStyle(
                                color: Colors.white,
                                fontSize: 32.0,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          )
                        ],
                      ),
                      decoration: new BoxDecoration(
                        image: new DecorationImage(
                            image: new AssetImage('assets/paintball.jpg'),
                        ),
                      ),
                    ),
                  ),
                  new Padding(
                    padding: new EdgeInsets.all(8.0),
                    child: new Text(
                      'BulletFinger ya está disponible en la PlayStore. ¡Avisa a tus amigos y empieza una partida!',
                      style: new TextStyle(
                        fontSize: 16.0,
                        color: Colors.black87,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  new Padding(
                    padding: new EdgeInsets.only(left:8.0, right:8.0, bottom: 8.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        new FlatButton(
                            onPressed: (){},
                            child: new Text(
                              'VER MÁS',
                              style: new TextStyle(
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
          ],
        ),
      ),
    );
  }

}