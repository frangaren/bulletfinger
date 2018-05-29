import 'package:flutter/material.dart';
import 'package:bulletfinger/models/video.dart';
import 'package:bulletfinger/views/player.dart';
import 'package:intl/intl.dart';

class PlayScreen extends StatelessWidget {
  final Video video;
  final Function delete;
  final Function share;

  PlayScreen (this.video, {this.delete, this.share});

  String _creationDate() {
    DateTime date = video.date;
    DateFormat format = new DateFormat();
    return format.format(date);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text('Ver vídeo'),
      ),
      body: new Column(
        children: <Widget>[
          new Player(video),
          new Divider(),
          new Expanded(
            child: new Align(
              alignment: Alignment.centerLeft,
              child: new Padding(
                padding: new EdgeInsets.only(left: 16.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(
                      video.name,
                      style: new TextStyle(
                          fontSize: 32.0
                      ),
                    ),
                    new Text(
                        _creationDate(),
                        style: new TextStyle(
                          fontSize: 18.0,
                          color: new Color(0x80000000),
                        )
                    )
                  ],
                ),
              ),
            ),
          ),
          new Padding(
            padding: new EdgeInsets.only(bottom: 8.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                new FlatButton(
                  onPressed: (){
                    Navigator.pop(context);
                    delete(video);
                  },
                  child: new Text(
                    'BORRAR',
                    style: new TextStyle(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ),
                new FlatButton(
                  onPressed: (){
                    Navigator.pop(context);
                    share(video);
                  },
                  child: new Text(
                    'COMPARTIR',
                    style: new TextStyle(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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