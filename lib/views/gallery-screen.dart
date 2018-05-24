import 'package:flutter/material.dart';
import 'package:bulletfinger/models/profile.dart';
import 'package:bulletfinger/views/drawer.dart';
import 'package:bulletfinger/views/video-list.dart';
import 'package:bulletfinger/models/video.dart' as model;

class Gallery extends StatelessWidget {
  final Profile profile;
  final List<model.Video> videos;

  Gallery(this.profile, this.videos);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: new MyDrawer(
        profile,
        selectedOption: '/gallery',
      ),
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text('Galería'),
      ),
      body: new VideoList(this.videos),
    );
  }

}