import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    new Future.delayed(new Duration(seconds: 2)).then(
            (_)=>Navigator.pushReplacementNamed(context, '/detect-peripherals')
    );
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xFF1775D1),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Image(
              image: new AssetImage('assets/icon.png'),
              width: 240.0,
            ),
            new Container(
              margin: new EdgeInsets.only(
                  top: 30.0
              ),
              child: new Text(
                'BulletFinger',
                style: new TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}

class LoadingScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new _LoadingScreenState();
  }

}