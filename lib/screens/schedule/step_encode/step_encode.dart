import 'package:flutter/material.dart';
import 'package:tiledmedia/data/models/encode.model.dart';
import 'package:tiledmedia/data/models/profile.model.dart';
import 'package:tiledmedia/services/profile.service.dart';
import 'package:tiledmedia/util/common.dart';
import 'package:tiledmedia/util/constants.dart';
import 'package:tiledmedia/util/theme.dart';
import 'package:tiledmedia/widgets/primary_button/primary_button.dart';

class StepEncode extends StatefulWidget {
  StepEncode({Key key, this.encode, this.onNext, this.onPrev}) : super(key: key);

  final Encode encode;
  final VoidCallback onNext;
  final VoidCallback onPrev;

  @override
  _StepEncodeState createState() => new _StepEncodeState(encode, onNext, onPrev);
}

class _StepEncodeState extends State<StepEncode> {
  final formKey = GlobalKey<FormState>();
  VoidCallback onNext;
  VoidCallback onPrev;

  List<String> profiles = [];
  Encode encode;

  String videoProfileName;
  ProfileService _profileService = ProfileService.getInstance();

  _StepEncodeState(encode, onNext, onPrev) {
    this.encode = encode;
    this.onNext = onNext;
    this.onPrev = onPrev;
  }

  @override
  void initState() {
    super.initState();
    initProfiles();
  }

  initProfiles() {
    _profileService.postProfiles(encode).then((value) {
      for (int i = 0; i < value.length; i++) {
        profiles.add(value[i]['profile_name']);
      }
      if (profiles.length > 0) {
        videoProfileName = profiles[0];
      }
    });
  }

  onSubmit() {
    if (formKey.currentState.validate()) {
      final form = formKey.currentState;
      form.save();
      onNext();
    }
  }

  changedProfile(val) {
    setState(() {
      encode.videoProfileName = val;
      videoProfileName = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
      child: Form(
        key: formKey,
        autovalidate: true,
        child: Column(
          children: <Widget>[
            TextFormField(
              validator: (value) {
                if (value.contains(' ')) {
                  return 'Encode name cannot contain whitespace';
                }
                return null;
              },
              initialValue: encode.name,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'Short name for your encode'),
              onSaved: (val) => setState(() => encode.name = val),
            ),
            TextFormField(
              initialValue: encode.comment,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'Comment for your encode'),
              onSaved: (val) => setState(() => encode.comment = val),
            ),
            DropdownButtonFormField(
              items: profiles.map((itm) {
                return new DropdownMenuItem(
                  value: itm,
                  child: new Text(itm),
                );
              }).toList(),
              validator: (value) {
                if (value == null) {
                  return 'This field can not be empty';
                }
                return null;
              },
              value: videoProfileName,
              onChanged: (val) => changedProfile(val),
              decoration: InputDecoration(labelText: 'Choose recommended video profile'),
              onSaved: (val) => setState(() => encode.videoProfileName = val),
            ),
            DropdownButtonFormField(
              items: Constants.packageFormats.entries.map((itm) {
                return new DropdownMenuItem(
                  value: itm.key,
                  child: new Text(itm.value),
                );
              }).toList(),
              value: encode.packagingFormat,
              onChanged: (val) => setState(() => encode.packagingFormat = val),
              decoration: InputDecoration(labelText: 'Packaging format'),
              onSaved: (val) => setState(() => encode.packagingFormat = val),
            ),
            TextFormField(
              initialValue: encode.outputFolder,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'Specify the output folder'),
              onSaved: (val) => setState(() => encode.outputFolder = val),
            ),
            SwitchListTile(
              contentPadding: EdgeInsets.only(left: 0),
              title: Text('Encode audio channels automatically'),
              value: encode.autoAudioKbpsPerChannel,
              onChanged: (value) {
                setState(() => encode.autoAudioKbpsPerChannel = value);
              },
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
