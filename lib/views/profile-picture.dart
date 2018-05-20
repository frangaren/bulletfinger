import 'package:flutter/material.dart';
import 'package:bulletfinger/models/profile.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePictureState extends State<ProfilePicture> {
  final Profile profile;

  ProfilePictureState(this.profile);

  @override
  void initState() {
    super.initState();
    this.profile.changes.forEach((record) {
      setState(() {});
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
                        profile.image = new FileImage(file);
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
                        profile.image = new FileImage(file);
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
            image: profile.image,
          ),
        ),
      ),
      onTap: () => changePicture(context),
    );
  }
}

class ProfilePicture extends StatefulWidget {
  final Profile profile;

  ProfilePicture (this.profile);

  @override
  State<StatefulWidget> createState() {
    return new ProfilePictureState(profile);
  }
}