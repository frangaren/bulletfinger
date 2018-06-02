import 'package:flutter/material.dart';
import 'package:bulletfinger/models/game.dart';
import 'package:map_view/map_view.dart';
import 'package:bulletfinger/config.dart';

class ViewGameScreen extends StatelessWidget {
  final Game game;
  final List<Game> playerGames;

  ViewGameScreen(this.game, this.playerGames);

  @override
  Widget build(BuildContext context) {
    var provider = new StaticMapProvider(GOOGLE_API_KEY);
    MapView.setApiKey(GOOGLE_API_KEY);
    MapView map = new MapView();
    Widget action;
    if (playerGames.contains(game)) {
      action = new FlatButton(
        onPressed: () {
          playerGames.remove(game);
          Navigator.of(context).pop();
        },
        child: new Text(
          'ABANDONAR',
          style: new TextStyle(
            color: Theme.of(context).accentColor,
          ),
        ),
      );
    } else {
      action = new FlatButton(
        onPressed: () {
          playerGames.add(game);
          Navigator.of(context).pop();
        },
        child: new Text(
          'UNIRSE',
          style: new TextStyle(
            color: Theme.of(context).accentColor,
          ),
        ),
      );
    }
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Información de la partida'),
      ),
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new InkWell(
            child: new Image(
              image: new NetworkImage(provider.getStaticUriWithMarkers(
                  [
                    new Marker(
                      'GameLocation',
                      'Partida',
                      game.latitude,
                      game.longitude,
                    )
                  ],
                  center: game.mapLocation).toString()),
            ),
          ),
          new Expanded(
            child: new Container(
              padding: new EdgeInsets.all(16.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        game.locationName,
                        style: Theme.of(context).textTheme.headline,
                      ),
                      new Padding(
                        padding: new EdgeInsets.only(top: 16.0),
                        child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              new Text(
                                'Fecha',
                                style:Theme.of(context).textTheme.title,
                              ),
                              new Text(
                                game.dateString,
                                style: new TextStyle(
                                  color: Colors.black54,
                                  fontSize: 20.0,
                                ),
                              ),
                            ]
                        ),
                      ),
                      new Padding(
                        padding: new EdgeInsets.only(top: 16.0),
                        child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              new Text(
                                'Hora',
                                style:Theme.of(context).textTheme.title,
                              ),
                              new Text(
                                game.timeString,
                                style: new TextStyle(
                                  color: Colors.black54,
                                  fontSize: 20.0,
                                ),
                              ),
                            ]
                        ),
                      ),

                    ],
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      action
                    ],
                  ),
                ],
              ),
            )
          ),
        ],
      )
    );
  }
}
