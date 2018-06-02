import 'package:flutter/material.dart';
import 'package:bulletfinger/models/profile.dart';

class ProfileHeader extends StatefulWidget {
  final Profile profile;

  ProfileHeader(this.profile);

  @override
  State<StatefulWidget> createState() {
    return new ProfileHeaderState(this.profile);
  }
}

class ProfileHeaderState extends State<ProfileHeader> {
  final Profile profile;

  ProfileHeaderState(this.profile);

  @override
  Widget build(BuildContext context) {
    return new UserAccountsDrawerHeader(
      accountName: new Text(profile.name),
      accountEmail: new Text(profile.mail),
      currentAccountPicture: new Hero(
          tag: 'ProfilePicture',
          child: new CircleAvatar(backgroundImage: profile.image)
      ),
      onDetailsPressed: () {
        Navigator.pushNamed(context, '/profile')
            .then((_) => setState((){}));
      }
    );
  }
}

