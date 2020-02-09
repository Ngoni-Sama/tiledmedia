import 'package:flutter/material.dart';
import 'package:tiledmedia/data/profile.model.dart';
import 'package:tiledmedia/util/globals.dart';
import 'package:tiledmedia/util/theme.dart';
import 'package:tiledmedia/widgets/appbar_layout/index.dart';
import 'package:tiledmedia/widgets/primary_button/primary_button.dart';

class Encode extends StatefulWidget {
  Encode({Key key}) : super(key: key);

  @override
  _EncodeState createState() => new _EncodeState();
}

class _EncodeState extends State<Encode> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBarLayout(
        appBarTitle: 'Encode Video',
        context: context,
      ),
      body: new Container(
        child: LayoutBuilder(builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[

                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
