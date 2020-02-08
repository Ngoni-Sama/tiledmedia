import 'package:flutter/material.dart';
import 'package:tiledmedia/util/globals.dart';
import 'package:tiledmedia/widgets/primary_button/index.dart';

class SettingDialog extends StatefulWidget {
  SettingDialog({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SettingDialogState createState() => new _SettingDialogState();
}

class _SettingDialogState extends State<SettingDialog> {
  final formKey = GlobalKey<FormState>();

  onSubmit() {
    if (formKey.currentState.validate()) {
      final form = formKey.currentState;
      form.save();
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      title: Text('Settings'),
      content: new Form(
        key: formKey,
        child: Container(
          child: Column(
            children: <Widget>[
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'X-API-KEY cannot be empty';
                  }
                  return null;
                },
                initialValue: Globals.xAPIKey,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: 'X-API-KEY'),
                onSaved: (val) => setState(() => Globals.xAPIKey = val),
              ),
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'API-AUTH-TOKEN cannot be empty';
                  }
                  return null;
                },
                initialValue: Globals.apiAuthToken,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: 'API-AUTH-TOKEN'),
                onSaved: (val) => setState(() => Globals.apiAuthToken = val),
              ),
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Customer ID cannot be empty';
                  }
                  return null;
                },
                initialValue: Globals.customerID,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: 'Customer ID'),
                onSaved: (val) => setState(() => Globals.customerID = val),
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        PrimaryButton(buttonName: 'Save', onPressed: onSubmit),
        FlatButton(child: Text('Cancel'), onPressed: () => Navigator.of(context).pop()),
      ],
    );
  }
}
