import 'package:flutter/material.dart';
import 'package:tiledmedia/data/models/profile.model.dart';
import 'package:tiledmedia/util/common.dart';
import 'package:tiledmedia/util/theme.dart';
import 'package:tiledmedia/widgets/appbar_layout/appbar_layout.dart';

class Profiles extends StatefulWidget {
  Profiles({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ProfilesState createState() => new _ProfilesState();
}

class _ProfilesState extends State<Profiles> {
  List<Profile> profiles = [];

  @override
  void initState() {
    super.initState();
    Common.initializeApp();
    Profile.getAllProfiles().then((val) => setState(() => profiles = val));
  }

  Widget profileElement(String name, String remark, int id) {
    return Container(
      margin: EdgeInsets.fromLTRB(24, 16, 24, 16),
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        boxShadow: [BoxShadow(color: Colors.blueGrey, blurRadius: 10)],
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 16, top: 8),
                  child: Text(name, style: TextStyle(color: Colors.white, fontSize: 24)),
                ),
                Container(
                  padding: EdgeInsets.only(left: 16, bottom: 8),
                  child: Text(remark, style: TextStyle(color: AppColors.lightColor, fontSize: 16)),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(top: 8, bottom: 8),
            child: MaterialButton(
              color: Colors.white,
              textColor: AppColors.primaryColor,
              child: Icon(Icons.delete, size: 24),
              padding: EdgeInsets.all(12),
              shape: CircleBorder(),
              onPressed: () => deleteItem(id),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(top: 8, bottom: 8),
            child: MaterialButton(
              color: Colors.white,
              textColor: AppColors.primaryColor,
              child: Icon(Icons.edit, size: 24),
              padding: EdgeInsets.all(12),
              shape: CircleBorder(),
              onPressed: () {
                Navigator.of(context).pushNamed('create-profile', arguments: <String, int>{
                  'id': id,
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  deleteItem(int idx) {
    Profile.deleteByIndex(idx).then((_) {
      Profile.getAllProfiles().then((value) => setState(() => profiles = value));
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> profileWidgets = [];
    for (int i = 0; i < profiles.length; i++) {
      profileWidgets.add(profileElement(profiles[i].name, profiles[i].remark, i));
    }

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
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(top: 8, bottom: 8),
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
                          children: profileWidgets,
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
