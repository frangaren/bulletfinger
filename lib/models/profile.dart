import 'dart:typed_data';
import 'package:observe/observe.dart';

class Profile extends Object with Observable {
  @observable
  ByteData _image;
  @observable
  String _name;
  @observable
  String _mail;
  @observable
  String _phone;
  @observable
  DateTime _lastGame;

  get image {
    return this._image;
  }

  set image(ByteData value) {
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
    final RegExp mailRegex = new RegExp(r"^\d{9}$");
    if (mailRegex.hasMatch(value)) {
      this._mail = value.trim();
    } else {
      throw new Exception('Invalid phone');
    }
  }

  get lastGame {
    return this._lastGame;
  }

  void updateLastGame() {
    this._lastGame = new DateTime.now();
  }

}