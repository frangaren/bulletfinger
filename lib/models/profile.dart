import 'package:flutter/painting.dart';
import 'package:observable/observable.dart';

class Profile {
  ImageProvider _image;
  String _name;
  String _mail;
  String _phone;
  DateTime _lastGame;

  Profile(String name, String mail, String phone, {ImageProvider image}) {
    this.name = name;
    this.mail = mail;
    this.phone = phone;
    if (image == null) {
      this.image = AssetImage('assets/blank-profile.png');
    } else {
      this.image = image;
    }
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