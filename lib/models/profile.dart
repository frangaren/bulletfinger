import 'package:flutter/painting.dart';
import 'dart:math';

class Profile {
  ImageProvider _image;
  String _name;
  String _mail;
  String _phone;
  DateTime _lastGame;

  Profile(String name, String mail, String phone, {ImageProvider image, DateTime lastGame}) {
    this.name = name;
    this.mail = mail;
    this.phone = phone;
    if (image == null) {
      this.image = AssetImage('assets/blank-profile.png');
    } else {
      this.image = image;
    }
    if (lastGame == null) {
      this._lastGame = new DateTime.now();
    } else {
      this._lastGame = lastGame;
    }
  }

  factory Profile.randomize({int seed, String name}) {
    const List<String> NAMES = [
      'Francisco',
      'Ricardo',
      'Carlos',
      'Marco',
      'Angel',
      'Jose',
      'Alvaro',
      'Roberto',
      'Nuria',
      'Sandra',
    ];
    const List<String> MAIL_DOMAINS = [
      '@gmail.com',
      '@hotmail.com',
      '@outlook.com',
      '@usal.es',
      '@bash-team.local',
    ];
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
    String finalName = name ?? NAMES[random.nextInt(NAMES.length)];
    String mail = finalName.toLowerCase() + MAIL_DOMAINS[random.nextInt(MAIL_DOMAINS.length)];
    String phone = (random.nextInt(999999999 - 100000000 + 1) + 100000000).toString();
    String image = 'assets/samples/image' + random.nextInt(10).toString() + '.jpg';
    return new Profile(finalName, mail, phone, lastGame: date, image: AssetImage(image));
  }

  get image {
    return this._image;
  }

  set image(ImageProvider value) {
    this._image = value;
  }

  get name {
    return this._name;
  }

  set name(String value) {
    this._name = value.trim();
  }

  get mail {
    return this._mail;
  }

  set mail(String value) {
    final RegExp mailRegex = new RegExp(r"^.+@.+\..+$");
    if (mailRegex.hasMatch(value)) {
      this._mail = value.trim();
    } else {
      throw new Exception('Invalid mail');
    }
  }

  get phone {
    return this._phone;
  }

  set phone(String value) {
    final RegExp phoneRegex = new RegExp(r"^\d{9}$");
    if (phoneRegex.hasMatch(value)) {
      this._phone = value.trim();
    } else {
      throw new Exception('Invalid phone');
    }
  }

  get lastGame {
    return this._lastGame;
  }

  void updateLastGame() {
    DateTime value = new DateTime.now();
    this._lastGame = value;
  }

}