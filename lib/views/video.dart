import 'package:flutter/material.dart';

class Video extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
      child: new Card(
        child: new AspectRatio(
          aspectRatio: 1.0,
          child: new Text(
            'Item',
            style: Theme.of(context).textTheme.headline,
          ),
        ),
      ),
    );
  }

}