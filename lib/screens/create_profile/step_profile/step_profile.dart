import 'package:flutter/material.dart';
import 'package:tiledmedia/data/profile.model.dart';
import 'package:tiledmedia/util/common.dart';
import 'package:tiledmedia/util/globals.dart';
import 'package:tiledmedia/util/theme.dart';
import 'package:tiledmedia/widgets/primary_button/primary_button.dart';

class StepProfile extends StatefulWidget {
  StepProfile({Key key, this.profile, this.onNext, this.onPrev}) : super(key: key);

  final Profile profile;
  final VoidCallback onNext;
  final VoidCallback onPrev;

  @override
  _StepProfileState createState() => new _StepProfileState(profile, onNext, onPrev);
}

class _StepProfileState extends State<StepProfile> {
  final nameCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();
  VoidCallback onNext;
  VoidCallback onPrev;
  String srcLoc;
  String dstLoc;
  Profile profile;

  _StepProfileState(profile, onNext, onPrev) {
    this.profile = profile;
    this.onNext = onNext;
    this.onPrev = onPrev;
  }

  _onSubmit() {
    if (formKey.currentState.validate()) {
      final form = formKey.currentState;
      form.save();
      onNext();
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Form(
        autovalidate: true,
        key: formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Profile name cannot be empty';
                }
                return null;
              },
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'Profile name'),
              onSaved: (val) => setState(() => profile.name = val),
            ),
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return null;
                }
                String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}\\@[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}(\\.[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25})+";
                RegExp regExp = new RegExp(p);
                if (!regExp.hasMatch(value)) {
                  return 'This field requires a valid email address';
                }
                return null;
              },
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: 'Notification email address'),
              onSaved: (val) => setState(() => profile.email = val),
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'Remarks about profile'),
              onSaved: (val) => setState(() => profile.remark = val),
            ),
            DropdownButtonFormField(
              items: Globals.contentSourceLocations.entries.map((itm) {
                return new DropdownMenuItem(
                  value: itm.key,
                  child: new Text(itm.value),
                );
              }).toList(),
              value: srcLoc,
              onChanged: (val) {
                setState(() {
                  srcLoc = val;
                });
              },
              decoration: InputDecoration(labelText: 'Select content source location'),
              onSaved: (val) => setState(() => profile.sourceLocation = val),
            ),
            DropdownButtonFormField(
              items: Globals.contentDestinationLocations.entries.map((itm) {
                return new DropdownMenuItem(
                  value: itm.key,
                  child: new Text(itm.value),
                );
              }).toList(),
              value: dstLoc,
              onChanged: (val) {
                setState(() {
                  dstLoc = val;
                });
              },
              decoration: InputDecoration(labelText: 'Select content destination location'),
              onSaved: (val) => setState(() => profile.destLocation = val),
            ),
            Container(
              margin: EdgeInsets.only(top: AppStyles.dGap),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new PrimaryButton(
                    onPressed: onPrev,
                    buttonName: 'Prev',
                  ),
                  new PrimaryButton(
                    onPressed: _onSubmit,
                    buttonName: 'Next',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
