import 'package:flutter/material.dart';
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

  _StepChooseState(onNext, onPrev) {
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
      width: double.infinity,
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
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
