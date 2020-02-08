import 'package:flutter/material.dart';
import 'package:tiledmedia/data/profile.model.dart';
import 'package:tiledmedia/util/globals.dart';
import 'package:tiledmedia/util/theme.dart';
import 'package:tiledmedia/widgets/primary_button/primary_button.dart';

class StepInput extends StatefulWidget {
  StepInput({Key key, this.profile, this.onNext, this.onPrev}) : super(key: key);

  final Profile profile;
  final VoidCallback onNext;
  final VoidCallback onPrev;

  @override
  _StepInputState createState() => new _StepInputState(profile, onNext, onPrev);
}

class _StepInputState extends State<StepInput> {
  final formKey = GlobalKey<FormState>();
  Profile profile;
  VoidCallback onNext;
  VoidCallback onPrev;
  String srcLoc;
  String s3Region;

  _StepInputState(profile, onNext, onPrev) {
    this.profile = profile;
    this.onNext = onNext;
    this.onPrev = onPrev;

    this.srcLoc = this.profile.srcLocType;
    this.s3Region = this.profile.srcCredentials['s3bucket']['region'];
  }

  _onSubmit() {
    if (formKey.currentState.validate()) {
      final form = formKey.currentState;
      form.save();
      onNext();
    }
  }

  _changedType(type) {
    setState(() {
      this.srcLoc = type;
    });
  }

  Widget s3BucketForm() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 32, bottom: 8),
            child: Text('S3 Bucket Details', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          DropdownButtonFormField(
            items: Globals.s3Regions.entries.map((itm) {
              return new DropdownMenuItem(
                value: itm.key,
                child: new Text(itm.value),
              );
            }).toList(),
            value: this.s3Region,
            decoration: InputDecoration(labelText: 'S3 bucket region'),
            onSaved: (val) => profile.srcCredentials['s3bucket']['region'] = val,
            onChanged: (val) => profile.srcCredentials['s3bucket']['region'] = val,
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Access key ID cannot be empty';
              }
              return null;
            },
            initialValue: profile.srcCredentials['s3bucket']['access_key_id'],
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Access key ID'),
            onSaved: (val) => profile.srcCredentials['s3bucket']['access_key_id'] = val,
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Secret Access key cannot be empty';
              }
              return null;
            },
            initialValue: profile.srcCredentials['s3bucket']['secret_access_key'],
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Secret Access key'),
            onSaved: (val) => profile.srcCredentials['s3bucket']['secret_access_key'] = val,
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Bucket name cannot be empty';
              }
              return null;
            },
            initialValue: profile.srcCredentials['s3bucket']['bucket'],
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Bucket name'),
            onSaved: (val) => profile.srcCredentials['s3bucket']['bucket'] = val,
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return null;
              }
              if (!Uri.parse(value).isAbsolute) {
                return 'Custom location requires a valid URL address';
              }
              return null;
            },
            initialValue: profile.srcCredentials['s3bucket']['custom_endpoint'],
            keyboardType: TextInputType.url,
            decoration: InputDecoration(labelText: 'Custom S3 bucket location e.g. https://s3.eu-west-1.amazonaws.com/mybucket'),
            onSaved: (val) => profile.srcCredentials['s3bucket']['custom_endpoint'] = val,
          ),
        ],
      ),
    );
  }

  Widget azureForm() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 32, bottom: 8),
            child: Text('Azure Blob Details', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Account name cannot be empty';
              }
              return null;
            },
            initialValue: profile.srcCredentials['azure-blob']['account_key'],
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Account name'),
            onSaved: (val) => profile.srcCredentials['azure-blob']['account_key'] = val,
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Account key cannot be empty';
              }
              return null;
            },
            initialValue: profile.srcCredentials['azure-blob']['access_key_id'],
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Account key'),
            onSaved: (val) => profile.srcCredentials['azure-blob']['access_key_id'] = val,
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Container cannot be empty';
              }
              if (!Uri.parse(value).isAbsolute) {
                return 'Container requires a valid URL address';
              }
              return null;
            },
            initialValue: profile.srcCredentials['azure-blob']['container'],
            keyboardType: TextInputType.url,
            decoration: InputDecoration(labelText: 'Container e.g. https://my.blob.core.windows.net/mycontainer'),
            onSaved: (val) => profile.srcCredentials['azure-blob']['container'] = val,
          ),
        ],
      ),
    );
  }

  Widget httpForm() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 32, bottom: 8),
            child: Text('You selected HTTP source location, please proceed to Output configuration', style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }

  Widget printForm() {
    switch (this.srcLoc) {
      case 's3bucket':
        return s3BucketForm();
        break;
      case 'azure-blob':
        return azureForm();
        break;
      case 'http-pull':
        return httpForm();
        break;
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
            DropdownButtonFormField(
              items: Globals.srcLocType.entries.map((itm) {
                return new DropdownMenuItem(
                  value: itm.key,
                  child: new Text(itm.value),
                );
              }).toList(),
              value: srcLoc,
              onChanged: (val) => _changedType(val),
              decoration: InputDecoration(labelText: 'Source video location type'),
              onSaved: (val) => profile.srcLocType = val,
            ),
            printForm(),
            Container(
              margin: EdgeInsets.only(top: AppStyles.gap_16),
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
