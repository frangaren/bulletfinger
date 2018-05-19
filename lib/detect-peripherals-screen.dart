import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class _DetectPeripheralsScreenState extends State<DetectPeripheralsScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void deactivate() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xFF1775D1),
      body: new Center(
        child: new Text('Hello world'),
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