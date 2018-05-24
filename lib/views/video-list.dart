import 'package:flutter/material.dart';
import 'package:bulletfinger/views/video.dart';

class VideoListState extends State<VideoList> {

  @override
  Widget build(BuildContext context) {
    return new GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),
        children: new List.generate(100, (index) {
          return new Video();
        })
    );
  }
}

class VideoList extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new VideoListState();
  }

}