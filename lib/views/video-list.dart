import 'package:flutter/material.dart';
import 'package:bulletfinger/views/video.dart';
import 'package:bulletfinger/models/video.dart' as model;

class VideoListState extends State<VideoList> {
  List<model.Video> videos;

  VideoListState(this.videos);

  @override
  Widget build(BuildContext context) {
    return new GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),
        children: new List.generate(videos.length, (index) {
          return new Video(videos[index]);
        })
    );
  }

}

class VideoList extends StatefulWidget {
  List<model.Video> videos;

  VideoList(this.videos);

  @override
  State<StatefulWidget> createState() {
    return new VideoListState(this.videos);
  }

}