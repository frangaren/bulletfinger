import 'package:flutter/material.dart';
import 'package:bulletfinger/models/profile.dart';

class ProfileHeader extends StatelessWidget {
  final Profile profile;

  ProfileHeader(this.profile);

  @override
  Widget build(BuildContext context) {
    return new UserAccountsDrawerHeader(
      accountName: new Text(profile.name),
      accountEmail: new Text(profile.mail),
      currentAccountPicture: new Hero(
        tag: 'ProfilePicture',
        child:new Container(
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            image: new DecorationImage(
              fit: BoxFit.fill,
              image: profile.image,
            ),
          ),
        ),
      ),
      onDetailsPressed: () => Navigator.pushNamed(context, '/profile'),
    );
  }
}