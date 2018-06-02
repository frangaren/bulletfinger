import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WaitPlayersScreenState extends State<WaitPlayersScreen> {
  bool detecting = true;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    new Future.delayed(new Duration(seconds: 2)).then(
        (_) => Navigator.pushReplacementNamed(context, '/in_game')
    );
  }

  @override
  Widget build(BuildContext context) {
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
              new Container(
                margin: new EdgeInsets.only(bottom: 20.0),
                child: new Text(
                  'Esperando al resto de jugadores',
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                    fontSize: 26.0,
                    color: Colors.white,
                  ),
                ),
              ),
              new CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }

}

class WaitPlayersScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new WaitPlayersScreenState();
  }

}