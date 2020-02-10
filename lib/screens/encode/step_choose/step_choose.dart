import 'package:flutter/material.dart';
import 'package:tiledmedia/data/models/profile.model.dart';
import 'package:tiledmedia/data/repositories/profile.proc.dart';
import 'package:tiledmedia/util/globals.dart';
import 'package:tiledmedia/util/theme.dart';
import 'package:tiledmedia/widgets/primary_button/primary_button.dart';

class StepChoose extends StatefulWidget {
  StepChoose({Key key, this.onNext, this.onPrev}) : super(key: key);

  final VoidCallback onNext;
  final VoidCallback onPrev;

  @override
  _StepChooseState createState() => new _StepChooseState(onNext, onPrev);
}

class _StepChooseState extends State<StepChoose> {
  final nameCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();
  VoidCallback onNext;
  VoidCallback onPrev;

  List<Profile> profiles = [];
  Profile recommended = null;

  _StepChooseState(onNext, onPrev) {
    this.onNext = onNext;
    this.onPrev = onPrev;
  }

  @override
  void initState() {
    super.initState();
    getAllProfiles().then((value) => setState(() => profiles = value));
  }

  onSubmit() {
    if (formKey.currentState.validate()) {
      final form = formKey.currentState;
      form.save();
      onNext();
    }
  }

  changedType(type) {
    int id = profiles.indexOf(type);
    setState(() {
      this.recommended = type;
    });
  }

  List<DropdownMenuItem<String>> getProfiles() {
    List<DropdownMenuItem> menus = [];
    for (int i=0; i<profiles.length; i++) {
      menus.add(DropdownMenuItem(
        value: i,
        child: new Text(profiles[i].name),
      ));
    }
    return menus.map((e) => e as DropdownMenuItem<String>).toList();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            DropdownButtonFormField(
              items: profiles.map((itm) {
                return new DropdownMenuItem(
                  value: itm,
                  child: new Text(itm.name),
                );
              }).toList(),
              value: recommended,
              onChanged: (val) => changedType(val),
              decoration: InputDecoration(labelText: 'Source video location type'),
              onSaved: (val) => val,
            ),
            TextFormField(
              validator: (value) {
                if (value.contains(' ')) {
                  return 'Encode name cannot contain whitespace';
                }
                return null;
              },
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'Short name for your encode'),
              onSaved: (val) => setState(() => val),
            ),

            Container(
              margin: EdgeInsets.only(top: AppStyles.gap_16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new PrimaryButton(
                    onPressed: onPrev,
                    buttonName: 'Back',
                  ),
                  new PrimaryButton(
                    onPressed: onSubmit,
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
