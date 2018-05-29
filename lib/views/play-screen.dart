import 'package:flutter/material.dart';
import 'package:bulletfinger/models/video.dart';

class PlayScreen extends StatelessWidget {
  Video video;
  Function delete;
  Function share;

  PlayScreen (this.video, {this.delete, this.share});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text('Ver vídeo'),
      ),
      body: new Text('Hello World!'),
    );
    /*return new Center(
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
    );*/
  }

}