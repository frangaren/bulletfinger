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
    return new Column(
      children: <Widget>[
        new AspectRatio(
          aspectRatio: 1.0,
          child:new Container(
            child: new GestureDetector(
              child: new Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 128.0,
              ),
              onTap: () {
              },
            ),
            decoration: new BoxDecoration(
              image: new DecorationImage(
                fit: BoxFit.fitHeight,
                alignment: new Alignment(0.0, 0.0),
                image: video.image
              )
            ),
          ),
        ),
        new Row(
          children: <Widget>[
            new Icon(
              Icons.play_arrow,
              color: new Color(0x80000000),
              size: 48.0,
            ),
            new Expanded(
              child: new Slider(
                value: _currentTime,
                onChanged: (double value) {
                  setState(() {
                    _currentTime = value;
                  });
                },
                min: 0.0,
                max: _totalTime,
              ),
            ),
            new Icon(
              Icons.fullscreen,
              color: new Color(0x80000000),
              size: 48.0,
            )
          ],
        ),
      ],
    );
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