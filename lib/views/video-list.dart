import 'package:flutter/material.dart';
import 'package:bulletfinger/views/video.dart';
import 'package:bulletfinger/models/video.dart' as model;
import 'package:bulletfinger/views/play-screen.dart';

class VideoListState extends State<VideoList> {
  List<model.Video> videos;

  VideoListState(this.videos);

  void remove(BuildContext context, model.Video video) {
    setState(() => this.videos.remove(video));
    Scaffold.of(context).showSnackBar(new SnackBar(
      content: new Text('Video eliminado'),
      action: new SnackBarAction(
          label: 'DESHACER',
          onPressed: () => setState(() => this.videos.add(video)),
      ),
    ));
  }

  void share(BuildContext context, model.Video video) {
    //TODO
  }

  void play(BuildContext context, model.Video video) {
    Navigator.of(context).push(new MaterialPageRoute(
        builder: (BuildContext context) {
          return new PlayScreen(video);
        },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return new GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),
        children: new List.generate(videos.length, (index) {
          return new Video(
            videos[index],
            delete: (video) => remove(context, video),
            share: (video) => share(context, video),
            play: (video) => play(context, video),
          );
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