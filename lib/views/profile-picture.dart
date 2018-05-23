import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePictureState extends State<ProfilePicture> {
  ImageProvider _picture;
  bool _editable;
  double _radius;

  ProfilePictureState(this._picture, this._editable, this._radius);

  get picture {
    return _picture;
  }

  set picture(ImageProvider value) {
    setState(() {
      _picture = value;
    });
  }

  void changePicture(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return new ListView(
            shrinkWrap: true,
            children: <Widget>[
              new ListTile(
                  leading: new Icon(Icons.camera),
                  title: new Text('Cámara'),
                  onTap: () {
                    ImagePicker.pickImage(source: ImageSource.camera).then((file) {
                      if (file != null) {
                        picture = new FileImage(file);
                      }
                      Navigator.pop(context);
                    });
                  }
              ),
              new ListTile(
                leading: new Icon(Icons.photo),
                title: new Text('Galería'),
                  onTap: () {
                    ImagePicker.pickImage(source: ImageSource.gallery).then((file) {
                      if (file != null) {
                        picture = new FileImage(file);
                      }
                      Navigator.pop(context);
                    });
                  }
              ),
            ],
          );
        },
    );
  }

  @override
  Widget build(BuildContext context) {
    CircleAvatar avatar;
    if (this._radius > 0) {
      avatar = new CircleAvatar(
        radius: this._radius,
        backgroundImage: picture,
      );
    } else {
      avatar = new CircleAvatar(
        backgroundImage: picture,
      );
    }
    return new GestureDetector(
      child: avatar,
      onTap: () {
        if (_editable) {
          changePicture(context);
        }
      },
    );
  }
}

class ProfilePicture extends StatefulWidget {
  final ImageProvider picture;
  final bool editable;
  final double radius;

  ProfilePicture (this.picture, this.editable, {Key key, this.radius = 0.0}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new ProfilePictureState(picture, editable, this.radius);
  }
}