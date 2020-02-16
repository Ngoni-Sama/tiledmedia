import 'package:flutter/material.dart';
import 'package:tiledmedia/data/models/setting.model.dart';
import 'package:tiledmedia/util/common.dart';
import 'package:tiledmedia/util/globals.dart';
import 'package:tiledmedia/util/theme.dart';
import 'package:tiledmedia/widgets/default_button/index.dart';
import 'package:tiledmedia/widgets/primary_button/index.dart';

class SettingDialog extends StatefulWidget {
  SettingDialog({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SettingDialogState createState() => new _SettingDialogState();
}

class _SettingDialogState extends State<SettingDialog> {
  final formKey = GlobalKey<FormState>();
  String xAPIKey = '';
  String apiAuthToken = '';
  int customerID;
  Setting setting;

  @override
  void initState() {
    xAPIKey = Globals.setting.xAPIKey;
    apiAuthToken = Globals.setting.apiAuthToken;
    customerID = Globals.setting.customerID;
    setting = Globals.setting;
  }

  onSubmit() {
    if (formKey.currentState.validate()) {
      final form = formKey.currentState;
      form.save();
      Globals.setting.saveSetting(customerID, apiAuthToken, xAPIKey);
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
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Input your secret info provided by TiledMedia', style: TextStyle(color: AppColors.defaultColor)),
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'X-API-KEY cannot be empty';
                  }
                  return null;
                },
                initialValue: setting.xAPIKey.toString(),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: 'X-API-KEY'),
                onSaved: (val) => setState(() => xAPIKey = val),
              ),
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'API-AUTH-TOKEN cannot be empty';
                  }
                  return null;
                },
                initialValue: setting.apiAuthToken,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: 'API-AUTH-TOKEN'),
                onSaved: (val) => setState(() => apiAuthToken = val),
              ),
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Customer ID cannot be empty';
                  }
                  if (!Common.isNumeric(value)) {
                    return 'Customer ID must be numeric';
                  }
                  return null;
                },
                initialValue: setting.customerID != null ? setting.customerID.toString() : '',
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: 'Customer ID'),
                onSaved: (val) => setState(() => customerID = int.tryParse(val)),
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        PrimaryButton(buttonName: 'Save', onPressed: onSubmit),
        Padding(
          padding: EdgeInsets.only(right: 8),
          child: DefaultButton(
            buttonName: 'Cancel',
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ],
    );
  }
}
