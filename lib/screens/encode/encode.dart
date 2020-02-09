import 'package:flutter/material.dart';
import 'package:tiledmedia/data/profile.model.dart';
import 'package:tiledmedia/screens/encode/step_choose/index.dart';
import 'package:tiledmedia/util/globals.dart';
import 'package:tiledmedia/util/theme.dart';
import 'package:tiledmedia/widgets/appbar_layout/index.dart';
import 'package:tiledmedia/widgets/primary_button/primary_button.dart';

class Encode extends StatefulWidget {
  Encode({Key key}) : super(key: key);

  @override
  _EncodeState createState() => new _EncodeState();
}

class _EncodeState extends State<Encode> {
  int current = 0;
  List<Step> spr = <Step>[];

  List<Step> _getSteps(BuildContext context) {
    spr = <Step>[
      Step(
        title: const Text('Choose Profile'),
        content: new StepChoose(
          onNext: _moveNext,
          onPrev: _movePrev,
        ),
        state: _getState(0),
        isActive: true,
      ),
      Step(
        title: const Text('Encode Schedule'),
        content: new StepChoose(
          onNext: _moveNext,
          onPrev: _movePrev,
        ),
        state: _getState(1),
        isActive: true,
      ),
    ];
    return spr;
  }

  void _moveNext() {
    if (current < _getSteps(context).length - 1) {
      setState(() {
        current++;
      });
    }
  }

  void _movePrev() {
    if (current > 0) {
      setState(() {
        current--;
      });
    }
  }

  StepState _getState(int i) {
    if (current > i) {
      return StepState.complete;
    } else if (current == i) {
      return StepState.editing;
    } else {
      return StepState.disabled;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBarLayout(
        appBarTitle: 'Encode Video',
        context: context,
      ),
      body: new Container(
        child: new Stepper(
          steps: _getSteps(context),
          type: StepperType.horizontal,
          currentStep: current,
          controlsBuilder: (BuildContext context, {VoidCallback onStepContinue, VoidCallback onStepCancel}) => Container(),
        ),
      ),
    );
  }
}
