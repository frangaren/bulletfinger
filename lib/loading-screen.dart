import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoadingScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
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
          ],
        ),
      ),
    );
  }
}