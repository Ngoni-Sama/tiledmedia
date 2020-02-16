import 'package:flutter/material.dart';
import 'package:tiledmedia/screens/setting_dialog/setting_dialog.dart';
import 'package:tiledmedia/util/globals.dart';
import 'package:tiledmedia/util/theme.dart';
import 'package:tiledmedia/widgets/default_button/index.dart';
import 'package:tiledmedia/widgets/primary_button/index.dart';

class AppBarLayout extends AppBar {
  final String appBarTitle;
  final BuildContext context;
  final bool canGoBack;

  AppBarLayout({this.appBarTitle, this.context, this.canGoBack = true})
      : super(
          title: new Text(appBarTitle),
          leading: canGoBack
              ? IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.of(context).pop();
                  })
              : null,
          automaticallyImplyLeading: false,
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.format_list_bulleted, color: Colors.white),
              onPressed: () {
                Navigator.of(context).pushNamed('profiles');
              },
              tooltip: 'Profiles',
            ),
            new IconButton(
              icon: new Icon(Icons.developer_mode, color: Colors.white),
              onPressed: () {
                if (!Globals.setting.isConfigured()) {
                  showDialog(
                    context: context,
                    builder: (context) => new AlertDialog(
                      title: Text('Warning'),
                      content: Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text('You must config settings before encode your video', style: TextStyle(color: AppColors.defaultColor)),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        PrimaryButton(
                            buttonName: 'Ok',
                            onPressed: () {
                              Navigator.of(context).pop();
                              showDialog(
                                context: context,
                                builder: (context) => SettingDialog(),
                              );
                            }),
                        Padding(
                          padding: EdgeInsets.only(right: 8),
                          child: DefaultButton(
                            buttonName: 'Cancel',
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  Navigator.of(context).pushNamed('schedule-encode');
                }
              },
              tooltip: 'Encode',
            ),
            new IconButton(
              icon: new Icon(Icons.settings, color: Colors.white),
              onPressed: () {
                return showDialog(
                  context: context,
                  builder: (context) => SettingDialog(),
                );
              },
              tooltip: 'Settings',
            ),
          ],
        );
}
