import 'package:flutter/material.dart';
import 'package:bulletfinger/models/profile.dart';
import 'package:bulletfinger/views/drawer.dart';
import 'package:bulletfinger/views/profile-picture.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreenState extends State<ProfileScreen> {
  final Profile profile;

  ProfileScreenState(this.profile);

  @override
  void initState() {
    super.initState();
    this.profile.changes.forEach((record) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: new MyDrawer(
        profile,
        selectedOption: '/profile',
      ),
      appBar: new AppBar(
        title: new Text('Perfil'),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new ProfilePicture(profile),
          ],
        ),
      ),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  final Profile profile;

  ProfileScreen (this.profile);

  @override
  State<StatefulWidget> createState() {
    return new ProfileScreenState(profile);
  }
}