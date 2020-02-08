import 'package:flutter/material.dart';
import 'package:tiledmedia/data/profile.model.dart';
import 'package:tiledmedia/util/theme.dart';
import 'package:tiledmedia/widgets/primary_button/primary_button.dart';

class StepOutput extends StatefulWidget {
  StepOutput({Key key, this.profile, this.onNext, this.onPrev}) : super(key: key);

  final Profile profile;
  final VoidCallback onNext;
  final VoidCallback onPrev;

  @override
  _StepOutputState createState() => new _StepOutputState(profile, onNext, onPrev);
}

class _StepOutputState extends State<StepOutput> {
  final nameCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();
  VoidCallback onNext;
  VoidCallback onPrev;
  String srcLoc;
  String dstLoc;
  Profile profile;

  _StepOutputState(profile, onNext, onPrev) {
    this.profile = profile;
    this.onNext = onNext;
    this.onPrev = onPrev;
  }

  _onSubmit() {
    if (formKey.currentState.validate()) {
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
                  return 'Output HTTP URL can not be empty';
                }
                return null;
              },
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'Output HTTP URL'),
              onSaved: (val) => setState(() => {}),
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
