import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/services.dart';

class InGameScreenState extends State<InGameScreen> {
  int _teamPoints = 0;
  int _enemyPoints = 0;
  bool _gameEnded = false;
  Random random = new Random();

  @override
  void initState() {
    super.initState();
    updateScore(random.nextInt(10) * 2 + 1);
  }

  @override
  void deactivate() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.deactivate();
  }

  void updateScore(int remaining) {
    if (remaining <= 0) {
      setState(() {
        _gameEnded = true;
      });
      return;
    }
    new Future.delayed(new Duration(seconds: random.nextInt(5))).then(
      (_) {
        if (random.nextBool()) {
          setState(() {
            _teamPoints++;
          });
        } else {
          setState(() {
            _enemyPoints++;
          });
        }
        updateScore(remaining - 1);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!_gameEnded) {
      return new Scaffold(
        backgroundColor: Color(0xFF1775D1),
        body: new Center(
          child: new Container(
            margin: new EdgeInsets.symmetric(
              horizontal: 32.0,
            ),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Padding(
                  padding: new EdgeInsets.symmetric(vertical: 48.0),
                  child: new Column(
                    children: <Widget>[
                      new Text(
                        'Puntos de tu equipo',
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                          fontSize: 26.0,
                          color: Colors.white,
                        ),
                      ),
                      new Text(
                        _teamPoints.toString(),
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                          fontSize: 72.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.symmetric(vertical: 48.0),
                  child: new Column(
                    children: <Widget>[
                      new Text(
                        'Puntos del enemigo',
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                          fontSize: 26.0,
                          color: Colors.white,
                        ),
                      ),
                      new Text(
                        _enemyPoints.toString(),
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                          fontSize: 72.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return new Scaffold(
        backgroundColor: Color(0xFF1775D1),
        body: new Center(
          child: new Container(
            margin: new EdgeInsets.symmetric(
              horizontal: 32.0,
            ),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Padding(
                  padding: new EdgeInsets.symmetric(vertical: 48.0),
                  child: new Column(
                    children: <Widget>[
                      new Padding(
                        padding: new EdgeInsets.all(32.0),
                        child: new Text(
                          (_teamPoints > _enemyPoints) ? '¡Has ganado!' : '¡Has perdido!',
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                            fontSize: 48.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      new RaisedButton(
                        child: new Text('CONTINUAR'),
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed('/home');
                        }
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

}

class InGameScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new InGameScreenState();
  }

}