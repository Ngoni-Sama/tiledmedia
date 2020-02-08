import 'package:flutter/material.dart';
import 'package:tiledmedia/screens/setting_dialog/setting_dialog.dart';

class AppBarLayout extends AppBar {
  final String appBarTitle;
  final BuildContext context;
  final bool back;

  AppBarLayout({this.appBarTitle, this.context, this.back = true})
      : super(
          title: new Text(appBarTitle),
          leading: back
              ? IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('home');
                  })
              : null,
          actions: <Widget>[
            new IconButton(
                icon: new Icon(Icons.format_list_bulleted, color: Colors.white),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('profiles');
                }),
            new IconButton(
                icon: new Icon(Icons.laptop_mac, color: Colors.white),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('manage');
                }),
            new IconButton(
                icon: new Icon(Icons.settings, color: Colors.white),
                onPressed: () {
                  return showDialog(
                    context: context,
                    builder: (context) => SettingDialog(),
                  );
                },
                tooltip: 'Settings'),
          ],
        );
}
