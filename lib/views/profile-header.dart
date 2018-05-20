import 'package:flutter/material.dart';
import 'package:bulletfinger/models/profile.dart';

class ProfileHeaderState extends State<ProfileHeader> {
  final Profile profile;

  ProfileHeaderState(this.profile);

  @override
  void initState() {
    super.initState();
    this.profile.changes.forEach((record) {
      setState(() {});
    });
  }


  @override
  Widget build(BuildContext context) {
    return new UserAccountsDrawerHeader(
      accountName: new Text(profile.name),
      accountEmail: new Text(profile.mail),
      currentAccountPicture: new Container(
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          image: new DecorationImage(
            fit: BoxFit.fill,
            image: profile.image,
          ),
        ),
      ),
      onDetailsPressed: () => Navigator.pushNamed(context, '/profile'),
    );
  }
}

class ProfileHeader extends StatefulWidget {
  final Profile profile;

  ProfileHeader(this.profile);

  @override
  State<StatefulWidget> createState() {
    return new ProfileHeaderState(profile);
  }
}