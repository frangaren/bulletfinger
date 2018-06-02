import 'package:flutter/painting.dart';
import 'dart:math';

class Video {
  String _name;
  DateTime _date;
  ImageProvider _image;

  Video(String name, {DateTime date, ImageProvider image}) {
    this._name = name;
    this._date = date ?? new DateTime.now();
    this._image = image ?? new AssetImage('assets/paintball.jpg');
  }

  factory Video.randomize([int seed]) {
    Random random = new Random(seed);
    int seconds = random.nextInt(60);
    int minutes = random.nextInt(60);
    int hours = random.nextInt(60);
    int days = random.nextInt(7);
    DateTime date = (new DateTime.now()).subtract(new Duration(
      seconds: seconds,
      minutes: minutes,
      hours: hours,
      days: days,
    ));
    String name = 'Partida #' + random.nextInt(100).toString();
    String image = 'assets/samples/image' + random.nextInt(10).toString() + '.jpg';
    return new Video(name, date: date, image: AssetImage(image));
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