import 'package:flutter/material.dart';
import 'package:bulletfinger/models/profile.dart';
import 'package:bulletfinger/views/drawer.dart';
import 'package:bulletfinger/models/statistics.dart';
import 'package:charts_flutter/flutter.dart' as charts;

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
          new Container(
            margin: new EdgeInsets.only(
              top: 16.0,
              left: 4.0,
            ),
            child: new Text(
              'TIEMPO DE JUEGO',
              style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: Colors.black87,
              ),
            ),
          ),
          new Card(
            child: new Container(
              height: 128.0,
              margin: new EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 16.0,
              ),
              child: new charts.LineChart(
                <charts.Series<dynamic, num>>[
                  new charts.Series<double, int>(
                    id: 'Playtime',
                    domainFn: (double playTimes, int index) => index,
                    measureFn: (double playTime, int index) => playTime,
                    colorFn: (double playTime, int index) => new charts.Color.fromHex(code:'#1775D1'),
                    data: statistics.playTimes,
                  )
                ]
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
                  new Text('Horas de juego'),
                  new Text(
                    statistics.totalPlayTime.toStringAsFixed(2),
                    style: new TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          new Container(
            margin: new EdgeInsets.only(
              top: 16.0,
              left: 4.0,
            ),
            child: new Text(
              'PARTIDAS',
              style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: Colors.black87,
              ),
            ),
          ),
          new Card(
            child: new Container(
              height: 128.0,
              margin: new EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 16.0,
              ),
              child: new charts.LineChart(
                  <charts.Series<dynamic, num>>[
                    new charts.Series<int, int>(
                      id: 'Wins',
                      domainFn: (int games, int index) => index,
                      measureFn: (int games, int index) => games,
                      colorFn: (int games, int index) => new charts.Color.fromHex(code:'#08D48C'),
                      data: statistics.wins,
                    ),
                    new charts.Series<int, int>(
                      id: 'Loses',
                      domainFn: (int games, int index) => index,
                      measureFn: (int games, int index) => games,
                      colorFn: (int games, int index) => new charts.Color.fromHex(code:'#FF590A'),
                      data: statistics.loses,
                    )
                  ],
                defaultRenderer: new charts.LineRendererConfig(
                  includeArea: true,
                  stacked: true,
                ),
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
                      color: Theme.of(context).primaryColor,
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
                      color: new Color(0xff08d48c),
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
                      color: new Color(0xff08d48c),
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
                      color: new Color(0xffff590a),
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
                      color: new Color(0xffff590a),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          new Container(
            margin: new EdgeInsets.only(
              top: 16.0,
              left: 4.0,
            ),
            child: new Text(
              'DISPAROS',
              style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: Colors.black87,
              ),
            ),
          ),
          new Card(
            child: new Container(
              height: 128.0,
              margin: new EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 16.0,
              ),
              child: new charts.LineChart(
                <charts.Series<dynamic, num>>[
                  new charts.Series<int, int>(
                    id: 'LandedShoots',
                    domainFn: (int games, int index) => index,
                    measureFn: (int games, int index) => games,
                    colorFn: (int games, int index) => new charts.Color.fromHex(code:'#08D48C'),
                    data: statistics.landedShoots,
                  ),
                  new charts.Series<int, int>(
                    id: 'MissedShoots',
                    domainFn: (int games, int index) => index,
                    measureFn: (int games, int index) => games,
                    colorFn: (int games, int index) => new charts.Color.fromHex(code:'#FF590A'),
                    data: statistics.missedShoots,
                  )
                ],
                defaultRenderer: new charts.LineRendererConfig(
                  includeArea: true,
                  stacked: true,
                ),
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
                      color: Theme.of(context).primaryColor,
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
                      color: Theme.of(context).primaryColor,
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
                      color: new Color(0xff08d48c),
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
                      color: new Color(0xffff590a),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          new Container(
            margin: new EdgeInsets.only(
              top: 16.0,
              left: 4.0,
            ),
            child: new Text(
              'DISTANCIAS',
              style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: Colors.black87,
              ),
            ),
          ),
          new Card(
            child: new Container(
              height: 128.0,
              margin: new EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 16.0,
              ),
              child: new charts.LineChart(
                  <charts.Series<dynamic, num>>[
                    new charts.Series<double, int>(
                      id: 'Distance',
                      domainFn: (double playTimes, int index) => index,
                      measureFn: (double playTime, int index) => playTime,
                      colorFn: (double playTime, int index) => new charts.Color.fromHex(code:'#1775D1'),
                      data: statistics.distances,
                    )
                  ]
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
                      color: Theme.of(context).primaryColor,
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