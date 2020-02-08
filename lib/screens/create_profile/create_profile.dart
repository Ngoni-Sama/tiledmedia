import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tiledmedia/data/profile.model.dart';
import 'package:tiledmedia/screens/create_profile/output_profile/index.dart';
import 'package:tiledmedia/screens/create_profile/step_profile/index.dart';
import 'package:tiledmedia/widgets/appbar_layout/appbar_layout.dart';

class CreateProfile extends StatefulWidget {
  CreateProfile({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CreateProfileState createState() => new _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  int current = 0;
  List<Step> spr = <Step>[];
  final profile = new Profile();

  List<Step> _getSteps(BuildContext context) {
    spr = <Step>[
      Step(
        title: const Text('Profile'),
        content: new StepProfile(
          profile: profile,
          onNext: _moveNext,
          onPrev: _movePrev,
        ),
        state: _getState(0),
        isActive: true,
      ),
      Step(
        title: const Text('Output'),
        content: new StepOutput(
          profile: profile,
          onNext: _moveNext,
          onPrev: _movePrev,
        ),
        state: _getState(1),
        isActive: true,
      ),
      Step(title: const Text('Finish'), content: const Text('This is Content3'), state: _getState(2), isActive: true),
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
      appBar: new AppBarLayout(appBarTitle: 'Create Profile', context: context),
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
