import 'package:flutter/painting.dart';

class Video {
  String _name;
  DateTime _date;
  ImageProvider _image;

  Video(String name, {DateTime date, ImageProvider image}) {
    this._name = name;
    this._date = date ?? new DateTime.now();
    this._image = image ?? new AssetImage('assets/paintball.jpg');
  }

  get name {
    return _name;
  }

  get date {
    return _date;
  }

  get image {
    return _image;
  }
}