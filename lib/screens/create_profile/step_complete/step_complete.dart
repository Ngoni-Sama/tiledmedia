import 'package:flutter/material.dart';
import 'package:tiledmedia/data/models/profile.model.dart';
import 'package:tiledmedia/util/globals.dart';
import 'package:tiledmedia/util/theme.dart';
import 'package:tiledmedia/widgets/primary_button/primary_button.dart';

class StepComplete extends StatefulWidget {
  StepComplete({Key key, this.profile, this.onNext, this.onPrev}) : super(key: key);

  final Profile profile;
  final VoidCallback onNext;
  final VoidCallback onPrev;

  @override
  _StepCompleteState createState() => new _StepCompleteState(profile, onNext, onPrev);
}

class _StepCompleteState extends State<StepComplete> {
  final formKey = GlobalKey<FormState>();
  VoidCallback onNext;
  VoidCallback onPrev;
  Profile profile;
  String notificationType;

  _StepCompleteState(Profile profile, onNext, onPrev) {
    this.profile = profile;
    this.onNext = onNext;
    this.onPrev = onPrev;

    this.notificationType = profile.notificationType;
  }

  _onCreate() {
    if (formKey.currentState.validate()) {
      final form = formKey.currentState;
      form.save();
      profile.create();
      Navigator.of(context).pushNamed('profiles');
    }
  }

  _onSave() {
    if (formKey.currentState.validate()) {
      final form = formKey.currentState;
      form.save();
      profile.update(Globals.profileFormMode);
      Navigator.of(context).pushNamed('profiles');
    }
  }

  _onCreateAndEncode() {
    if (formKey.currentState.validate()) {
      final form = formKey.currentState;
      form.save();
      profile.create();
      Navigator.of(context).pushNamed('schedule-encode');
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
            DropdownButtonFormField(
              items: Globals.notificationType.entries.map((itm) {
                return new DropdownMenuItem(
                  value: itm.key,
                  child: new Text(itm.value),
                );
              }).toList(),
              value: notificationType,
              onChanged: (val) => setState(() => this.notificationType = val),
              decoration: InputDecoration(labelText: 'Notification type'),
              onSaved: (val) => profile.notificationType = val,
            ),
            this.notificationType == 'mail'
                ? TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Email address cannot be empty';
                      }
                      if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
                        return 'This field requires a valid email address';
                      }
                      return null;
                    },
                    initialValue: profile.mail,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: 'Email address'),
                    onSaved: (val) => setState(() => profile.mail = val),
                  )
                : TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Webhook URL cannot be empty';
                      }
                      if (!Uri.parse(value).isAbsolute) {
                        return 'This field requires a valid URL address';
                      }
                      return null;
                    },
                    initialValue: profile.webhook,
                    keyboardType: TextInputType.url,
                    decoration: InputDecoration(labelText: 'Webhook URL'),
                    onSaved: (val) => setState(() => profile.webhook = val),
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
                  Globals.profileFormMode == -1
                      ? new PrimaryButton(
                          onPressed: _onCreate,
                          buttonName: 'Create',
                        )
                      : new PrimaryButton(
                          onPressed: _onSave,
                          buttonName: 'Save',
                        ),
                  Globals.profileFormMode == -1
                      ? new PrimaryButton(
                          onPressed: _onCreateAndEncode,
                          buttonName: 'Create & Encode',
                        )
                      : new PrimaryButton(
                          onPressed: _onCreate,
                          buttonName: 'Create as New',
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
