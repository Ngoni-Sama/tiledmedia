import 'package:flutter/material.dart';
import 'package:tiledmedia/widgets/appbar_layout/appbar_layout.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBarLayout(appBarTitle: 'Tiledmedia', context: context, canGoBack: false),
      body: new Container(
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new FlatButton(onPressed: null, child: null),
              new Padding(padding: new EdgeInsets.all(8.0), child: new FlatButton(onPressed: null, child: null)),
            ],
          ),
        ),
      ),
    );
  }
}
