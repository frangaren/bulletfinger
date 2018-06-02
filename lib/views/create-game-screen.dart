import 'package:flutter/material.dart';
import 'package:bulletfinger/models/game.dart';
import 'package:map_view/map_view.dart';
import 'package:bulletfinger/config.dart';
import 'dart:async';

class CreateGameScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new CreateGameScreenState();
  }

}

class CreateGameScreenState extends State<CreateGameScreen> {
  final Game game = new Game();

  @override
  void initState() {
    super.initState();
    (new Future.delayed(new Duration(seconds: 3))).then((_) => setState((){}));
  }

  @override
  Widget build(BuildContext context) {
    var provider = new StaticMapProvider(GOOGLE_API_KEY);
    MapView.setApiKey(GOOGLE_API_KEY);
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Crear partida'),
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: () {
            Navigator.pop(context, game);
          },
          tooltip: 'Crear',
          child: new Icon(Icons.done),
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
                    children: <Widget>[
                      new Text(
                        game.locationName,
                        style: Theme.of(context).textTheme.headline,
                      ),
                      new Padding(
                        padding: new EdgeInsets.only(top: 16.0),
                        child: new InkWell(
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
                          onTap: () {
                            DateTime now = new DateTime.now();
                            DateTime start = new DateTime(now.year, now.month, now.day);
                            showDatePicker(
                                context: context,
                                initialDate: game.date,
                                firstDate: start,
                                lastDate: (new DateTime.now()).add(new Duration(days: 7))
                            ).then((DateTime date) => setState(() {
                              DateTime newDate = new DateTime(
                                date.year,
                                date.month,
                                date.day,
                                game.date.hour,
                                game.date.minute,
                              );
                              game.date = newDate;
                            }));
                          },
                        )
                      ),
                      new Padding(
                          padding: new EdgeInsets.only(top: 16.0),
                          child: new InkWell(
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
                            onTap: () {
                              TimeOfDay start = new TimeOfDay(
                                  hour: game.date.hour,
                                  minute: game.date.minute
                              );
                              showTimePicker(
                                  context: context,
                                  initialTime: start
                              ).then((TimeOfDay time) => setState((){
                                DateTime newDate = new DateTime(
                                  game.date.year,
                                  game.date.month,
                                  game.date.day,
                                  time.hour,
                                  time.minute,
                                );
                                game.date = newDate;
                              }));
                            },
                          )
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