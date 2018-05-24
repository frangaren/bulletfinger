import 'package:flutter/material.dart';
import 'package:bulletfinger/models/profile.dart';
import 'package:bulletfinger/views/drawer.dart';

class Gallery extends StatelessWidget {
  final Profile profile;

  Gallery(this.profile);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: new MyDrawer(
        profile,
        selectedOption: '/gallery',
      ),
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text('Galería'),
      ),
      body: new GridView.count(
        crossAxisCount: 2,
        children: new List.generate(100, (index) {
          return new Center(
            child: new Text(
              'Item $index',
              style: Theme.of(context).textTheme.headline,
            ),
          );
        }),
      ),
    );
  }

}