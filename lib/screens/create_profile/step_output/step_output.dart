import 'package:flutter/material.dart';
import 'package:tiledmedia/data/models/profile.model.dart';
import 'package:tiledmedia/util/common.dart';
import 'package:tiledmedia/util/constants.dart';
import 'package:tiledmedia/util/globals.dart';
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
  final formKey = GlobalKey<FormState>();
  Profile profile;
  VoidCallback onNext;
  VoidCallback onPrev;
  String destLoc;
  String s3Region;

  _StepOutputState(profile, onNext, onPrev) {
    this.profile = profile;
    this.onNext = onNext;
    this.onPrev = onPrev;

    this.destLoc = this.profile.destLocType;
    this.s3Region = this.profile.destCredentials['s3bucket']['region'];
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
      this.destLoc = type;
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
            items: Constants.s3Regions.entries.map((itm) {
              return new DropdownMenuItem(
                value: itm.key,
                child: new Text(itm.value),
              );
            }).toList(),
            value: this.s3Region,
            decoration: InputDecoration(labelText: 'S3 bucket region'),
            onSaved: (val) => profile.destCredentials['s3bucket']['region'] = val,
            onChanged: (val) => profile.destCredentials['s3bucket']['region'] = val,
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Access key ID cannot be empty';
              }
              return null;
            },
            initialValue: profile.destCredentials['s3bucket']['access_key_id'],
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Access key ID'),
            onSaved: (val) => profile.destCredentials['s3bucket']['access_key_id'] = val,
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Secret Access key cannot be empty';
              }
              return null;
            },
            initialValue: profile.destCredentials['s3bucket']['secret_access_key'],
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Secret Access key'),
            onSaved: (val) => profile.destCredentials['s3bucket']['secret_access_key'] = val,
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Bucket name cannot be empty';
              }
              return null;
            },
            initialValue: profile.destCredentials['s3bucket']['bucket'],
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Bucket name'),
            onSaved: (val) => profile.destCredentials['s3bucket']['bucket'] = val,
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
            initialValue: profile.destCredentials['s3bucket']['custom_endpoint'],
            keyboardType: TextInputType.url,
            decoration: InputDecoration(labelText: 'Custom S3 bucket location e.g. https://s3.eu-west-1.amazonaws.com/mybucket'),
            onSaved: (val) => profile.destCredentials['s3bucket']['custom_endpoint'] = val,
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
            initialValue: profile.destCredentials['azure-blob']['account_name'],
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Account name'),
            onSaved: (val) => profile.destCredentials['azure-blob']['account_name'] = val,
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Account key cannot be empty';
              }
              return null;
            },
            initialValue: profile.destCredentials['azure-blob']['account_key'],
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Account key'),
            onSaved: (val) => profile.destCredentials['azure-blob']['account_key'] = val,
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
            initialValue: profile.destCredentials['azure-blob']['container'],
            keyboardType: TextInputType.url,
            decoration: InputDecoration(labelText: 'Container e.g. https://my.blob.core.windows.net/mycontainer'),
            onSaved: (val) => profile.destCredentials['azure-blob']['container'] = val,
          ),
        ],
      ),
    );
  }

  Widget akamaiNsForm() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 32, bottom: 8),
            child: Text('Akamai NS Details', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Akamai host cannot be empty';
              }
              return null;
            },
            initialValue: profile.destCredentials['akamai-ns']['host'],
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Akamai host e.g. emea-myfiels-nsu.akamaihd.net'),
            onSaved: (val) => profile.destCredentials['akamai-ns']['host'] = val,
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Akamai keyname cannot be empty';
              }
              return null;
            },
            initialValue: profile.destCredentials['akamai-ns']['keyname'],
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Akamai keyname e.g. emea'),
            onSaved: (val) => profile.destCredentials['akamai-ns']['keyname'] = val,
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Akamai key cannot be empty';
              }
              return null;
            },
            initialValue: profile.destCredentials['akamai-ns']['key'],
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Akamai key'),
            onSaved: (val) => profile.destCredentials['akamai-ns']['key'] = val,
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Akamai cpcode cannot be empty';
              }
              if (!Common.isNumeric(value)) {
                return 'Akamai cpcode must be numeric';
              }
              if (value.length != 6) {
                return 'Akamai cpcode must be 6 digit code';
              }
              return null;
            },
            initialValue: profile.destCredentials['akamai-ns']['cpcode'],
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Akamai cpcode'),
            onSaved: (val) => profile.destCredentials['akamai-ns']['cpcode'] = val,
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Akamai path cannot be empty';
              }
              return null;
            },
            initialValue: profile.destCredentials['akamai-ns']['path'],
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Akamai path'),
            onSaved: (val) => profile.destCredentials['akamai-ns']['path'] = val,
          ),
        ],
      ),
    );
  }

  Widget wangsuForm() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 32, bottom: 8),
            child: Text('Wangsu Details', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Wangsu host cannot be empty';
              }
              if (!Uri.parse(value).isAbsolute) {
                return 'Wangsu host requires a valid URL address';
              }
              return null;
            },
            initialValue: profile.destCredentials['wangsu']['host'],
            keyboardType: TextInputType.url,
            decoration: InputDecoration(labelText: 'Wangsu host'),
            onSaved: (val) => profile.destCredentials['wangsu']['host'] = val,
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Wangsu token cannot be empty';
              }
              return null;
            },
            initialValue: profile.destCredentials['wangsu']['token'],
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Wangsu token'),
            onSaved: (val) => profile.destCredentials['wangsu']['token'] = val,
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Wangsu path cannot be empty';
              }
              return null;
            },
            initialValue: profile.destCredentials['wangsu']['path'],
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Wangsu path'),
            onSaved: (val) => profile.destCredentials['wangsu']['path'] = val,
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
            child: Text('You selected HTTP destination location, please proceed to final step', style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }

  Widget printForm() {
    switch (this.destLoc) {
      case 's3bucket':
        return s3BucketForm();
        break;
      case 'azure-blob':
        return azureForm();
        break;
      case 'akamai-ns':
        return akamaiNsForm();
        break;
      case 'wangsu':
        return wangsuForm();
        break;
      case 'http-put':
        return httpForm();
        break;
    }
    return Container();
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
              items: Constants.destLocType.entries.map((itm) {
                return new DropdownMenuItem(
                  value: itm.key,
                  child: new Text(itm.value),
                );
              }).toList(),
              value: destLoc,
              onChanged: (val) => _changedType(val),
              decoration: InputDecoration(labelText: 'Source video location type'),
              onSaved: (val) => setState(() => profile.destLocType = val),
            ),
            printForm(),
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
