import 'package:flutter/material.dart';
import 'package:tiledmedia/data/models/encode.model.dart';
import 'package:tiledmedia/services/profile.service.dart';
import 'package:tiledmedia/util/constants.dart';
import 'package:tiledmedia/util/theme.dart';
import 'package:tiledmedia/widgets/primary_button/primary_button.dart';

class StepSchedule extends StatefulWidget {
  StepSchedule({Key key, this.encode, this.onNext, this.onPrev}) : super(key: key);

  final Encode encode;
  final VoidCallback onNext;
  final VoidCallback onPrev;

  @override
  _StepScheduleState createState() => new _StepScheduleState(encode, onNext, onPrev);
}

class _StepScheduleState extends State<StepSchedule> {
  final formKey = GlobalKey<FormState>();
  VoidCallback onNext;
  VoidCallback onPrev;
  Encode encode;

  _StepScheduleState(encode, onNext, onPrev) {
    this.encode = encode;
    this.onNext = onNext;
    this.onPrev = onPrev;
  }

  @override
  void initState() {
    super.initState();
  }

  onSubmit() {
    if (formKey.currentState.validate()) {

    }
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
            Container(
              child: Text(
                'Source Video Details (${encode.chosenProfile.srcLocType})',
                style: TextStyle(color: Colors.blueAccent, fontSize: 16),
              ),
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
                    buttonName: 'Start Encode',
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
