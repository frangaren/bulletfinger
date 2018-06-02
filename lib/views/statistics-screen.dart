import 'package:flutter/material.dart';
import 'package:bulletfinger/models/profile.dart';
import 'package:bulletfinger/views/drawer.dart';
import 'package:bulletfinger/models/statistics.dart';

class StatisticsScreen extends StatelessWidget {
  final Profile profile;
  final Statistics statistics;

  StatisticsScreen(this.profile, this.statistics, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: new MyDrawer(
        profile,
        selectedOption: '/statistics',
      ),
      appBar: new AppBar(
        title: new Text('Estadísticas'),
      ),
      body: new ListView(
        children: <Widget>[
          new Card(
            child: new Container(
              margin: new EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 32.0,
              ),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text('Horas de juego'),
                  new Text(
                    statistics.totalPlayTime.toStringAsFixed(2),
                    style: new TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          new Card(
            child: new Container(
              margin: new EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 32.0,
              ),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text('Partidas'),
                  new Text(
                    statistics.totalGames.toStringAsFixed(0),
                    style: new TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          new Card(
            child: new Container(
              margin: new EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 32.0,
              ),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text('Victorias'),
                  new Text(
                    statistics.totalWins.toStringAsFixed(0),
                    style: new TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          new Card(
            child: new Container(
              margin: new EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 32.0,
              ),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text('Porcentaje de victoria'),
                  new Text(
                    statistics.totalWinPercentage.toStringAsFixed(2) + '%',
                    style: new TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          new Card(
            child: new Container(
              margin: new EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 32.0,
              ),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text('Derrotas'),
                  new Text(
                    statistics.totalLoses.toStringAsFixed(0),
                    style: new TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          new Card(
            child: new Container(
              margin: new EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 32.0,
              ),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text('Porcentaje de derrota'),
                  new Text(
                    statistics.totalLosePercentage.toStringAsFixed(2) + '%',
                    style: new TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          new Card(
            child: new Container(
              margin: new EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 32.0,
              ),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text('Disparos'),
                  new Text(
                    statistics.totalShoots.toStringAsFixed(0),
                    style: new TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          new Card(
            child: new Container(
              margin: new EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 32.0,
              ),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text('Precisión'),
                  new Text(
                    statistics.totalLandedShootPercentage.toStringAsFixed(2) + '%',
                    style: new TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          new Card(
            child: new Container(
              margin: new EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 32.0,
              ),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text('Disparos acertados'),
                  new Text(
                    statistics.totalLandedShoots.toStringAsFixed(0),
                    style: new TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          new Card(
            child: new Container(
              margin: new EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 32.0,
              ),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text('Disparos fallados'),
                  new Text(
                    statistics.totalMissedShoots.toStringAsFixed(0),
                    style: new TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          new Card(
            child: new Container(
              margin: new EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 32.0,
              ),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text('Distancia recorrida'),
                  new Text(
                    statistics.totalDistance.toStringAsFixed(2) + 'km',
                    style: new TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}