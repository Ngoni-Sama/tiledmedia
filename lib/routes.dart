import 'package:flutter/material.dart';
import 'package:tiledmedia/screens/create_profile/create_profile.dart';
import 'package:tiledmedia/screens/home/home.dart';
import 'package:tiledmedia/screens/profiles/profiles.dart';
import 'package:tiledmedia/util/theme.dart';

class Routes {
  final routes = <String, WidgetBuilder>{
    'home': (BuildContext context) => new Home(),
    'profiles': (BuildContext context) => new Profiles(),
    'create-profile': (BuildContext context) => new CreateProfile(),
  };

  Routes () {
    runApp(new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ClearVR Cloud Encoding and Packaging',
      theme: appTheme(),
      routes: routes,
      home: new Profiles(),
    ));
  }
}