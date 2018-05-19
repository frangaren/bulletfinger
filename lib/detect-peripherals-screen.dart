import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class _DetectPeripheralsScreenState extends State<DetectPeripheralsScreen> {
  bool detecting = true;

  @override
  void initState() {
    super.initState();
    new Future.delayed(new Duration(seconds: 2)).then(
        (_) => setState(() => this.detecting = false)
    );
  }

  @override
  void deactivate() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.deactivate();
  }

  void navigate_to_home(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/home');
  }

  RaisedButton buildButton(BuildContext context) {
    String label = 'DETECTANDO';
    Function callback;
    if (!this.detecting) {
      label = 'CONTINUAR';
      callback = () => navigate_to_home(context);
    }
    return new RaisedButton(
      child: new Text(label),
      disabledTextColor: Colors.black,
      onPressed: callback,
    );
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
              image: new AssetImage('assets/instructions.png'),
            ),
            this.buildButton(context),
          ],
        ),
      ),
    );
  }

}

class DetectPeripheralsScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new _DetectPeripheralsScreenState();
  }

}