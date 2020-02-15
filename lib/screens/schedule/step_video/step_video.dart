import 'package:flutter/material.dart';
import 'package:tiledmedia/data/models/encode.model.dart';
import 'package:tiledmedia/util/common.dart';
import 'package:tiledmedia/util/constants.dart';
import 'package:tiledmedia/util/theme.dart';
import 'package:tiledmedia/widgets/primary_button/primary_button.dart';

class StepVideo extends StatefulWidget {
  StepVideo({Key key, this.encode, this.onNext, this.onPrev}) : super(key: key);

  final Encode encode;
  final VoidCallback onNext;
  final VoidCallback onPrev;

  @override
  _StepVideoState createState() => new _StepVideoState(encode, onNext, onPrev);
}

class _StepVideoState extends State<StepVideo> {
  final formKey = GlobalKey<FormState>();
  VoidCallback onNext;
  VoidCallback onPrev;
  Encode encode;

  _StepVideoState(encode, onNext, onPrev) {
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
      final form = formKey.currentState;
      form.save();
      onNext();
    }
  }

  sourceVideoDetails() {
    switch (encode.chosenProfile.srcLocType) {
      case 's3bucket':
        return Container(
          decoration: BoxDecoration(color: Colors.greenAccent),
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.only(top: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(child: Column(children: <Widget>[Text('Region'), Text(encode.chosenProfile.srcCredentials['s3bucket']['region'], style: AppStyles.boldTextStyle)])),
              Container(
                  child: Column(
                      children: <Widget>[Text('Custom Endpoint'), Text(encode.chosenProfile.srcCredentials['s3bucket']['custom_endpoint'], style: AppStyles.boldTextStyle)])),
              Container(child: Column(children: <Widget>[Text('Bucket'), Text(encode.chosenProfile.srcCredentials['s3bucket']['bucket'], style: AppStyles.boldTextStyle)])),
              Container(
                  child: Column(children: <Widget>[Text('Access Key ID'), Text(encode.chosenProfile.srcCredentials['s3bucket']['access_key_id'], style: AppStyles.boldTextStyle)])),
              Container(
                  child: Column(
                      children: <Widget>[Text('Secret Access Key'), Text(encode.chosenProfile.srcCredentials['s3bucket']['secret_access_key'], style: AppStyles.boldTextStyle)])),
            ],
          ),
        );
      case 'azure-blob':
        return Container(
          decoration: BoxDecoration(color: Colors.greenAccent),
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.only(top: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                  child: Column(children: <Widget>[Text('Account Name'), Text(encode.chosenProfile.srcCredentials['azure-blob']['account_name'], style: AppStyles.boldTextStyle)])),
              Container(
                  child: Column(children: <Widget>[Text('Account Key'), Text(encode.chosenProfile.srcCredentials['azure-blob']['account_key'], style: AppStyles.boldTextStyle)])),
              Container(child: Column(children: <Widget>[Text('Container'), Text(encode.chosenProfile.srcCredentials['azure-blob']['container'], style: AppStyles.boldTextStyle)])),
            ],
          ),
        );
    }
    return Container();
  }

  destinationVideoDetails() {
    switch (encode.chosenProfile.destLocType) {
      case 's3bucket':
        return Container(
          decoration: BoxDecoration(color: Colors.greenAccent),
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.only(top: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(child: Column(children: <Widget>[Text('Region'), Text(encode.chosenProfile.destCredentials['s3bucket']['region'], style: AppStyles.boldTextStyle)])),
              Container(
                  child: Column(
                      children: <Widget>[Text('Custom Endpoint'), Text(encode.chosenProfile.destCredentials['s3bucket']['custom_endpoint'], style: AppStyles.boldTextStyle)])),
              Container(child: Column(children: <Widget>[Text('Bucket'), Text(encode.chosenProfile.destCredentials['s3bucket']['bucket'], style: AppStyles.boldTextStyle)])),
              Container(
                  child:
                      Column(children: <Widget>[Text('Access Key ID'), Text(encode.chosenProfile.destCredentials['s3bucket']['access_key_id'], style: AppStyles.boldTextStyle)])),
              Container(
                  child: Column(
                      children: <Widget>[Text('Secret Access Key'), Text(encode.chosenProfile.destCredentials['s3bucket']['secret_access_key'], style: AppStyles.boldTextStyle)])),
            ],
          ),
        );
      case 'azure-blob':
        return Container(
          decoration: BoxDecoration(color: Colors.greenAccent),
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.only(top: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                  child:
                      Column(children: <Widget>[Text('Account Name'), Text(encode.chosenProfile.destCredentials['azure-blob']['account_name'], style: AppStyles.boldTextStyle)])),
              Container(
                  child: Column(children: <Widget>[Text('Account Key'), Text(encode.chosenProfile.destCredentials['azure-blob']['account_key'], style: AppStyles.boldTextStyle)])),
              Container(
                  child: Column(children: <Widget>[Text('Container'), Text(encode.chosenProfile.destCredentials['azure-blob']['container'], style: AppStyles.boldTextStyle)])),
            ],
          ),
        );
      case 'wangsu':
        return Container(
          decoration: BoxDecoration(color: Colors.greenAccent),
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.only(top: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(child: Column(children: <Widget>[Text('Host'), Text(encode.chosenProfile.destCredentials['wangsu']['host'], style: AppStyles.boldTextStyle)])),
              Container(child: Column(children: <Widget>[Text('Token'), Text(encode.chosenProfile.destCredentials['wangsu']['token'], style: AppStyles.boldTextStyle)])),
              Container(child: Column(children: <Widget>[Text('Path'), Text(encode.chosenProfile.destCredentials['wangsu']['path'], style: AppStyles.boldTextStyle)])),
            ],
          ),
        );
      case 'akamai-ns':
        return Container(
          decoration: BoxDecoration(color: Colors.greenAccent),
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.only(top: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(child: Column(children: <Widget>[Text('Host'), Text(encode.chosenProfile.destCredentials['akamai-ns']['host'], style: AppStyles.boldTextStyle)])),
              Container(child: Column(children: <Widget>[Text('Key Name'), Text(encode.chosenProfile.destCredentials['akamai-ns']['keyname'], style: AppStyles.boldTextStyle)])),
              Container(child: Column(children: <Widget>[Text('Key'), Text(encode.chosenProfile.destCredentials['akamai-ns']['key'], style: AppStyles.boldTextStyle)])),
              Container(child: Column(children: <Widget>[Text('Cpcode'), Text(encode.chosenProfile.destCredentials['akamai-ns']['cpcode'], style: AppStyles.boldTextStyle)])),
              Container(child: Column(children: <Widget>[Text('path'), Text(encode.chosenProfile.destCredentials['akamai-ns']['path'], style: AppStyles.boldTextStyle)])),
            ],
          ),
        );
    }
    return Container();
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
            sourceVideoDetails(),
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'This field cannot be empty';
                }
                if (!Uri.parse(value).isAbsolute && encode.chosenProfile.srcLocType == 'http-pull') {
                  return 'Video source url requires a valid URL address';
                }
                return null;
              },
              initialValue: encode.srcFile,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: encode.chosenProfile.srcLocType == 'http-pull' ? 'Video source HTTP URL' : 'Video source path relative to bucket root'),
              onSaved: (val) => setState(() => encode.srcFile = val),
            ),
            encode.chosenProfile.inProjectionType == '360-erp-stereo-split-file'
                ? TextFormField(
                    initialValue: encode.secondaryFile,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(labelText: 'Secondary source file'),
                    onSaved: (val) => setState(() => encode.secondaryFile = val),
                  )
                : Container(),
            Row(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: Container(
                    child: SwitchListTile(
                      contentPadding: EdgeInsets.only(left: 0),
                      title: Text('Image sequence'),
                      value: encode.imageSequence,
                      onChanged: (value) {
                        setState(() => encode.imageSequence = value);
                      },
                    ),
                    padding: EdgeInsets.only(right: 8),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    child: SwitchListTile(
                      contentPadding: EdgeInsets.only(left: 0),
                      title: Text('Raw YUV'),
                      value: encode.rawYUV,
                      onChanged: (value) {
                        setState(() => encode.rawYUV = value);
                      },
                    ),
                    padding: EdgeInsets.only(left: 8),
                  ),
                ),
              ],
            ),
            encode.imageSequence
                ? Container(
                    padding: EdgeInsets.only(left: 8, right: 8, bottom: 4),
                    decoration: BoxDecoration(color: Colors.black12),
                    child: TextFormField(
                      validator: (value) {
                        if (value == '') {
                          return null;
                        }
                        if (!Common.isNumeric(value)) {
                          return 'This field should be numeric';
                        }
                        return null;
                      },
                      initialValue: encode.startingIndex != null ? encode.startingIndex.toString() : '',
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(labelText: 'Starting Index for image sequence'),
                      onSaved: (val) => setState(() => encode.startingIndex = int.tryParse(val)),
                    ),
                  )
                : Container(),
            encode.rawYUV
                ? Container(
                    padding: EdgeInsets.only(left: 8, right: 8, bottom: 4),
                    decoration: BoxDecoration(color: Colors.black12),
                    child: DropdownButtonFormField(
                      items: Constants.yuvFormats.entries.map((itm) {
                        return new DropdownMenuItem(
                          value: itm.key,
                          child: new Text(itm.value),
                        );
                      }).toList(),
                      value: encode.yuvFormat,
                      onChanged: (val) => setState(() => encode.yuvFormat = val),
                      decoration: InputDecoration(labelText: 'YUV format'),
                      onSaved: (val) => setState(() => encode.yuvFormat = val),
                    ),
                  )
                : Container(),
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'This field cannot be empty';
                }
                if (!Uri.parse(value).isAbsolute && encode.chosenProfile.srcLocType == 'http-pull') {
                  return 'Audio source url requires a valid URL address';
                }
                return null;
              },
              initialValue: encode.audioSrcFile,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: encode.chosenProfile.srcLocType == 'http-pull' ? 'Audio source HTTP URL' : 'Audio source path relative to bucket root'),
              onSaved: (val) => setState(() => encode.audioSrcFile = val),
            ),
            SwitchListTile(
              contentPadding: EdgeInsets.only(left: 0),
              title: Text('Accept input failures (Advanced)'),
              value: encode.acceptInputFailures,
              onChanged: (value) {
                setState(() => encode.acceptInputFailures = value);
              },
            ),
            Container(
              padding: EdgeInsets.only(top: 24),
              child: Text(
                'Destination Video Details (${encode.chosenProfile.destLocType})',
                style: TextStyle(color: Colors.blueAccent, fontSize: 16),
              ),
            ),
            destinationVideoDetails(),
            encode.chosenProfile.destLocType == 'http-put'
                ? TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'This field cannot be empty';
                      }
                      if (!Uri.parse(value).isAbsolute && encode.chosenProfile.srcLocType == 'http-pull') {
                        return 'Video destination url requires a valid URL address';
                      }
                      return null;
                    },
                    initialValue: encode.url,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(labelText: 'Video destination HTTP URL'),
                    onSaved: (val) => setState(() => encode.url = val),
                  )
                : TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Video destination path cannot be empty';
                      }
                      return null;
                    },
                    initialValue: encode.folder,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(labelText: 'Video destination path relative to bucket root'),
                    onSaved: (val) => setState(() => encode.folder = val),
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
