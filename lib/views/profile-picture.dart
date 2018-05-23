import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePictureState extends State<ProfilePicture> {
  ImageProvider _picture;
  bool _editable;

  ProfilePictureState(this._picture, this._editable);

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
    return new GestureDetector(
      child: new Container(
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          image: new DecorationImage(
            fit: BoxFit.fill,
            image: picture,
          ),
        ),
      ),
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

  ProfilePicture (this.picture, this.editable, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new ProfilePictureState(picture, editable);
  }
}