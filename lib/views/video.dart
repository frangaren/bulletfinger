import 'package:flutter/material.dart';
import 'package:bulletfinger/models/video.dart' as model;

class Video extends StatelessWidget {
  model.Video video;

  Video(this.video);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
      child: new Card(
        child: new AspectRatio(
          aspectRatio: 1.0,
          child: new Text(
            video.name,
            style: Theme.of(context).textTheme.headline,
          ),
        ),
      ),
    );
  }

}