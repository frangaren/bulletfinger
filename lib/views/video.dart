import 'package:flutter/material.dart';
import 'package:bulletfinger/models/video.dart' as model;

class Video extends StatelessWidget {
  model.Video video;
  Function delete;
  Function share;
  Function play;

  Video(this.video, {this.delete, this.share, this.play});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
      child: new Card(
        child: new AspectRatio(
          aspectRatio: 1.0,
          child: new Container(
            child: new Column(
              children: <Widget>[
                new Expanded(
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      new Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          new GestureDetector(
                            child: new Icon(
                                Icons.delete,
                                color: Colors.white,
                                size: 32.0
                            ),
                            onTap: () {
                              if (delete != null) {
                                delete(this.video);
                              }
                            },
                          ),
                        ],
                      ),
                      new GestureDetector(
                        child: new Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 64.0
                        ),
                        onTap: () {
                          if (play != null) {
                            play(this.video);
                          }
                        },
                      ),
                      new Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          new GestureDetector(
                            child: new Icon(
                                Icons.share,
                                color: Colors.white,
                                size: 32.0
                            ),
                            onTap: () {
                              if (share != null) {
                                share(this.video);
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
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
      ),
    );
  }

}