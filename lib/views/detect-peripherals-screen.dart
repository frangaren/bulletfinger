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

  void navigateToHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/home');
  }

  RaisedButton buildButton(BuildContext context) {
    String label = 'DETECTANDO';
    Function callback;
    if (!this.detecting) {
      label = 'CONTINUAR';
      callback = () => navigateToHome(context);
    }
    return new RaisedButton(
      child: new Text(label),
      disabledTextColor: Colors.black,
      onPressed: callback,
      padding: new EdgeInsets.symmetric(horizontal: 100.0),
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
                  '¡Un momento!',
                  style: new TextStyle(
                    fontSize: 52.0,
                    color: Colors.white,
                  ),
                ),
              ),
              new Text (
                'Acerca tu anillo  Bullet Finger a tu móvil. '
                    + 'Nosotros nos encargaremos de ponerlo todo a punto.',
                style: new TextStyle(
                  fontSize: 22.0,
                  color: Colors.white,
                ),
              ),
              new Image(
                image: new AssetImage('assets/instructions.png'),
              ),
              this.buildButton(context),
            ],
          ),
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