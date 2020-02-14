import 'package:flutter/material.dart';
import 'package:tiledmedia/data/models/encode.model.dart';
import 'package:tiledmedia/data/models/profile.model.dart';
import 'package:tiledmedia/util/common.dart';
import 'package:tiledmedia/util/theme.dart';
import 'package:tiledmedia/widgets/primary_button/primary_button.dart';

class StepChoose extends StatefulWidget {
  StepChoose({Key key, this.encode, this.onNext, this.onPrev}) : super(key: key);

  final Encode encode;
  final VoidCallback onNext;
  final VoidCallback onPrev;

  @override
  _StepChooseState createState() => new _StepChooseState(encode, onNext, onPrev);
}

class _StepChooseState extends State<StepChoose> {
  final formKey = GlobalKey<FormState>();
  VoidCallback onNext;
  VoidCallback onPrev;

  List<Profile> profiles = [];
  Profile recommended;
  Encode encode;

  Widget _summary = Container();

  _StepChooseState(encode, onNext, onPrev) {
    this.encode = encode;
    this.onNext = onNext;
    this.onPrev = onPrev;
  }

  @override
  void initState() {
    super.initState();
    Profile.getAllProfiles().then((value) => setState(() => profiles = value));
  }

  onSubmit() {
    if (formKey.currentState.validate()) {
      final form = formKey.currentState;
      form.save();
      onNext();
    }
  }

  changedProfile(type) {
    int id = profiles.indexOf(type);
    Profile.getProfileByIndex(id).then((pro) {
      setState(() {
        _summary = Container(
          decoration: BoxDecoration(color: Colors.greenAccent),
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(child: Column(children: <Widget>[Text('Name'), Text(pro.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))])),
              Container(child: Column(children: <Widget>[Text('Remarks'), Text(pro.remark, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))])),
              Container(child: Column(children: <Widget>[Text('Version'), Text(pro.version.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))])),
              Container(child: Column(children: <Widget>[Text('Input Projection'), Text(pro.inProjectionType, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))])),
              Container(child: Column(children: <Widget>[Text('Output Projection'), Text(pro.outProjectionType, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))])),
            ],
          ),
        );
      });
    });
    Encode.recommends = [];
    setState(() {
      this.recommended = type;
      this.encode.chosenProfile = type;
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
            DropdownButtonFormField(
              items: profiles.map((itm) {
                return new DropdownMenuItem(
                  value: itm,
                  child: new Text(itm.name),
                );
              }).toList(),
              validator: (value) {
                if (value == null) {
                  return 'This field can not be empty';
                }
                return null;
              },
              value: recommended,
              onChanged: (val) => changedProfile(val),
              decoration: InputDecoration(labelText: 'Choose your profile'),
              onSaved: (val) => val,
            ),
            _summary,
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Width cannot be empty';
                }
                if (!Common.isNumeric(value)) {
                  return 'Width must be numeric';
                }
                return null;
              },
              initialValue: encode.width != null ? encode.width.toString() : '',
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Video width'),
              onSaved: (val) => setState(() => encode.width = int.parse(val)),
            ),
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Height cannot be empty';
                }
                if (!Common.isNumeric(value)) {
                  return 'Height must be numeric';
                }
                return null;
              },
              initialValue: encode.height != null ? encode.height.toString() : '',
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Video height'),
              onSaved: (val) => setState(() => encode.height = int.parse(val)),
            ),
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Framerate cannot be empty';
                }
                if (!Common.isNumeric(value)) {
                  return 'Framerate must be numeric';
                }
                return null;
              },
              initialValue: encode.frameRateNumber != null ? encode.frameRateNumber.toString() : '',
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Numerator of Framerate'),
              onSaved: (val) => setState(() => encode.frameRateNumber = int.parse(val)),
            ),
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Framerate cannot be empty';
                }
                if (!Common.isNumeric(value)) {
                  return 'Framerate must be numeric';
                }
                return null;
              },
              initialValue: encode.frameRateDenom != null ? encode.frameRateDenom.toString() : '',
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Denominator of Framerate'),
              onSaved: (val) => setState(() => encode.frameRateDenom = int.parse(val)),
            ),
            Container(
              margin: EdgeInsets.only(top: AppStyles.gap_16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new PrimaryButton(
                    onPressed: () => Navigator.of(context).pop(),
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
