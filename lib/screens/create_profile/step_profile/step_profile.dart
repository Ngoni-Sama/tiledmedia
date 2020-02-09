import 'package:flutter/material.dart';
import 'package:tiledmedia/data/models/profile.model.dart';
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
  Profile profile;
  String inProjectionType;
  String outProjectionType;
  String encodeQuality;

  _StepProfileState(Profile profile, onNext, onPrev) {
    this.profile = profile;
    this.onNext = onNext;
    this.onPrev = onPrev;
    this.inProjectionType = profile.inProjectionType;
    this.outProjectionType = profile.outProjectionType;
    this.encodeQuality = profile.encodeQuality;
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
      width: double.infinity,
      child: Form(
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
              initialValue: profile.name,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'Profile name'),
              onSaved: (val) => setState(() => profile.name = val),
            ),
            TextFormField(
              initialValue: profile.remark,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'Remarks about profile'),
              onSaved: (val) => setState(() => profile.remark = val),
            ),
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Version cannot be empty';
                }
                if (!isNumeric(value)) {
                  return 'Version must be numeric';
                }
                return null;
              },
              initialValue: profile.version.toString(),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Version number'),
              onSaved: (val) => setState(() => profile.version = int.parse(val)),
            ),
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Width cannot be empty';
                }
                if (!isNumeric(value)) {
                  return 'Width must be numeric';
                }
                return null;
              },
              initialValue: profile.width.toString(),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Source video width'),
              onSaved: (val) => setState(() => profile.width = int.parse(val)),
            ),
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Height cannot be empty';
                }
                if (!isNumeric(value)) {
                  return 'Height must be numeric';
                }
                return null;
              },
              initialValue: profile.height.toString(),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Source video height'),
              onSaved: (val) => setState(() => profile.height = int.parse(val)),
            ),
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Framerate cannot be empty';
                }
                if (!isNumeric(value)) {
                  return 'Framerate must be numeric';
                }
                return null;
              },
              initialValue: profile.frameRateNumber.toString(),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Numerator of Framerate'),
              onSaved: (val) => setState(() => profile.frameRateNumber = int.parse(val)),
            ),
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Framerate cannot be empty';
                }
                if (!isNumeric(value)) {
                  return 'Framerate must be numeric';
                }
                return null;
              },
              initialValue: profile.frameRateDenom.toString(),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Denominator of Framerate'),
              onSaved: (val) => setState(() => profile.frameRateDenom = int.parse(val)),
            ),
            DropdownButtonFormField(
              items: Globals.inProjectionType.entries.map((itm) {
                return new DropdownMenuItem(
                  value: itm.key,
                  child: new Text(itm.value),
                );
              }).toList(),
              value: inProjectionType,
              onChanged: (val) {
                setState(() {
                  inProjectionType = val;
                });
              },
              decoration: InputDecoration(labelText: 'Input video projection type'),
              onSaved: (val) => setState(() => profile.inProjectionType = val),
            ),
            DropdownButtonFormField(
              items: Globals.outProjectionType.entries.map((itm) {
                return new DropdownMenuItem(
                  value: itm.key,
                  child: new Text(itm.value),
                );
              }).toList(),
              value: outProjectionType,
              onChanged: (val) {
                setState(() {
                  outProjectionType = val;
                });
              },
              decoration: InputDecoration(labelText: 'Output video projection type'),
              onSaved: (val) => setState(() => profile.outProjectionType = val),
            ),
            DropdownButtonFormField(
              items: Globals.encodeQuality.entries.map((itm) {
                return new DropdownMenuItem(
                  value: itm.key,
                  child: new Text(itm.value),
                );
              }).toList(),
              value: encodeQuality,
              onChanged: (val) {
                setState(() {
                  encodeQuality = val;
                });
              },
              decoration: InputDecoration(labelText: 'Encode quality'),
              onSaved: (val) => setState(() => profile.encodeQuality = val),
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
