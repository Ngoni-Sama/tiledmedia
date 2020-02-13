import 'package:flutter/material.dart';
import 'package:tiledmedia/screens/create_profile/index.dart';
import 'package:tiledmedia/screens/schedule/index.dart';
import 'package:tiledmedia/screens/home/home.dart';
import 'package:tiledmedia/screens/profiles/index.dart';
import 'package:tiledmedia/util/theme.dart';

class Routes {
  final routes = <String, WidgetBuilder>{
    'home': (BuildContext context) => new Home(),
    'profiles': (BuildContext context) => new Profiles(),
    'create-profile': (BuildContext context) => new CreateProfile(),
    'schedule-encode': (BuildContext context) => new Schedule(),
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