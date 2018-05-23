import 'package:flutter/material.dart';
import 'package:bulletfinger/models/profile.dart';
import 'package:bulletfinger/views/drawer.dart';
import 'package:bulletfinger/views/profile-picture.dart';

class ProfileScreenState extends State<ProfileScreen> {
  final Profile profile;
  Profile backup;
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();
  final pictureKey = new GlobalKey<ProfilePictureState>();
  ImageProvider picture;

  ProfileScreenState(this.profile);

  @override
  void initState() {
    super.initState();
    picture = this.profile.image;
  }

  void applyChanges(BuildContext context) {
    final form = formKey.currentState;
    backup = new Profile(profile.name, profile.mail, profile.phone,
      image: profile.image);
    profile.image = pictureKey.currentState.picture;
    form.save();
    //Navigator.pop(context); // <-- Go back
    scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text('Perfil actualizado'),
      action: new SnackBarAction(
          label: 'DESHACER',
          onPressed: undoChanges,
      ),
    ));
  }

  void undoChanges() {
    formKey.currentState.reset();
    profile.name = backup.name;
    profile.mail = backup.mail;
    profile.phone = backup.phone;
    profile.image = backup.image;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldKey,
      appBar: new AppBar(
        title: new Text('Perfil'),
      ),
      body: new Center(
        child: new Container(
          margin: new EdgeInsets.symmetric(horizontal: 16.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Hero(
                tag: 'ProfilePicture',
                child: new Container(
                  margin: new EdgeInsets.only(bottom: 12.0),
                  child: new ProfilePicture(this.profile.image, true, key: pictureKey),
                ),
              ),
              new Form(
                key: formKey,
                autovalidate: true,
                child: new Wrap(
                  children: <Widget>[
                    new TextFormField(
                      initialValue: profile.name,
                      decoration: new InputDecoration(
                          labelText: 'Usuario'
                      ),
                      onSaved: (value) => profile.name = value,
                    ),
                    new TextFormField(
                      initialValue: profile.mail,
                      decoration: new InputDecoration(
                          labelText: 'Correo'
                      ),
                      validator: (value) {
                        final RegExp mailRegex = new RegExp(r"^.+@.+\..+$");
                        if (mailRegex.hasMatch(value)) {
                          return null;
                        } else {
                          return 'Formato de correo inválido';
                        }
                      },
                      onSaved: (value) => profile.mail = value,
                    ),
                    new TextFormField(
                      initialValue: profile.phone,
                      decoration: new InputDecoration(
                          labelText: 'Teléfono'
                      ),
                      validator: (value) {
                        final RegExp phoneRegex = new RegExp(r"^\d{9}$");
                        if (phoneRegex.hasMatch(value)) {
                          return null;
                        } else {
                          return 'Formato de teléfono inválido';
                        }
                      },
                      onSaved: (value) => profile.phone = value,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () => applyChanges(context),
        tooltip: 'Aplicar cambios',
        child: new Icon(Icons.done),
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