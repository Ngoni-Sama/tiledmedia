import 'package:flutter/material.dart';
import 'package:tiledmedia/util/theme.dart';
import 'package:tiledmedia/widgets/appbar_layout/appbar_layout.dart';
import 'package:tiledmedia/widgets/primary_button/index.dart';

class Profiles extends StatefulWidget {
  Profiles({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ProfilesState createState() => new _ProfilesState();
}

class _ProfilesState extends State<Profiles> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBarLayout(
        appBarTitle: 'Tiledmedia Profiles',
        context: context,
        canGoBack: false,
      ),
      body: new Container(
        child: LayoutBuilder(builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(top: 8),
                  child: MaterialButton(
                    color: AppColors.primaryColor,
                    textColor: Colors.white,
                    child: Icon(Icons.add, size: 24),
                    padding: EdgeInsets.all(12),
                    shape: CircleBorder(),
                    onPressed: () {
                      Navigator.of(context).pushNamed('create-profile');
                    },
                  ),
                ),
                Expanded(
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
                            Container(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
