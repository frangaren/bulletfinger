import 'package:flutter/material.dart';
import 'package:bulletfinger/models/video.dart';

class PlayerState extends State<Player> {
  final Video video;
  double _currentTime;
  double _totalTime;

  PlayerState(this.video) {
    _currentTime = 0.0;
    _totalTime = 30.0;
  }

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return new Text('Hello World!');
  }
}

class Player extends StatefulWidget {
  final Video video;

  Player (this.video);

  @override
  State<StatefulWidget> createState() {
    return new PlayerState(video);
  }
}