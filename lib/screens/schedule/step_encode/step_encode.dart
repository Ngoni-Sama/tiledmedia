import 'package:flutter/material.dart';
import 'package:tiledmedia/data/models/encode.model.dart';
import 'package:tiledmedia/services/profile.service.dart';
import 'package:tiledmedia/util/common.dart';
import 'package:tiledmedia/util/constants.dart';
import 'package:tiledmedia/util/theme.dart';
import 'package:tiledmedia/widgets/primary_button/primary_button.dart';

class StepEncode extends StatefulWidget {
  StepEncode({Key key, this.encode, this.onNext, this.onPrev}) : super(key: key);

  final Encode encode;
  final VoidCallback onNext;
  final VoidCallback onPrev;

  @override
  _StepEncodeState createState() => new _StepEncodeState(encode, onNext, onPrev);
}

class _StepEncodeState extends State<StepEncode> {
  final formKey = GlobalKey<FormState>();
  VoidCallback onNext;
  VoidCallback onPrev;

  Encode encode;

  String videoProfileName;
  ProfileService _profileService = ProfileService.getInstance();

  _StepEncodeState(encode, onNext, onPrev) {
    this.encode = encode;
    this.onNext = onNext;
    this.onPrev = onPrev;
  }

  @override
  void initState() {
    super.initState();
    initProfiles();
  }

  initProfiles() {
    if (Encode.recommends.length == 0) {
      _profileService.postProfiles(encode).then((value) {
        for (int i = 0; i < value.length; i++) {
          setState(() {
            Encode.recommends.add(value[i]['profile_name']);
          });
        }
        if (Encode.recommends.length > 0) {
          setState(() {
            videoProfileName = Encode.recommends[0];
          });
        }
      });
    } else {
      setState(() {
        videoProfileName = encode.videoProfileName;
      });
    }
  }

  onSubmit() {
    if (formKey.currentState.validate()) {
      final form = formKey.currentState;
      form.save();
      onNext();
    }
  }

  changedProfile(val) {
    setState(() {
      encode.videoProfileName = val;
      videoProfileName = val;
    });
  }

  audioPanel() {
    if (encode.autoAudioKbpsPerChannel == null) {
      return Container();
    } else {
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.black12),
        padding: EdgeInsets.only(right: 8, left: 8, bottom: 4),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: Container(
                    child: TextFormField(
                      initialValue: encode.independentAudioFileIndex,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(labelText: 'Independent audio file index'),
                      onSaved: (val) => setState(() => encode.independentAudioFileIndex = val),
                    ),
                    padding: EdgeInsets.only(right: 8),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    child: TextFormField(
                      initialValue: encode.embeddedTrackIndex,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(labelText: 'Embedded track index'),
                      onSaved: (val) => setState(() => encode.embeddedTrackIndex = val),
                    ),
                    padding: EdgeInsets.only(left: 8),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: Container(
                    child: TextFormField(
                      initialValue: encode.trackName,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(labelText: 'Track name'),
                      onSaved: (val) => setState(() => encode.trackName = val),
                    ),
                    padding: EdgeInsets.only(right: 8),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    child: TextFormField(
                      validator: (value) {
                        if (value == '') {
                          return 'Target bitrate cannot be empty';
                        }
                        if (!Common.isNumeric(value)) {
                          return 'This field should be numeric';
                        }
                        return null;
                      },
                      initialValue: encode.targetBitrate == null ? '' : encode.targetBitrate.toString(),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'Target bitrate in kbps'),
                      onSaved: (val) => setState(() => encode.targetBitrate = int.tryParse(val)),
                    ),
                    padding: EdgeInsets.only(left: 8),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Flexible(
                  flex: 2,
                  child: Container(
                    child: DropdownButtonFormField(
                      items: Constants.languages.entries.map((itm) {
                        return new DropdownMenuItem(
                          value: itm.key,
                          child: new Text(itm.value),
                        );
                      }).toList(),
                      value: encode.language,
                      onChanged: (val) => setState(() => encode.language = val),
                      decoration: InputDecoration(labelText: 'Language'),
                      onSaved: (val) => setState(() => encode.language = val),
                    ),
                    padding: EdgeInsets.only(right: 8),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    child: DropdownButtonFormField(
                      items: Constants.spatials.entries.map((itm) {
                        return new DropdownMenuItem(
                          value: itm.key,
                          child: new Text(itm.value),
                        );
                      }).toList(),
                      value: encode.spatialAudio,
                      onChanged: (val) => setState(() => encode.spatialAudio = val),
                      decoration: InputDecoration(labelText: 'Spatial audio'),
                      onSaved: (val) => setState(() => encode.spatialAudio = val),
                    ),
                    padding: EdgeInsets.only(left: 8),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
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
            TextFormField(
              validator: (value) {
                if (value.contains(' ')) {
                  return 'Encode name cannot contain whitespace';
                }
                return null;
              },
              initialValue: encode.name,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'Short name for your encode'),
              onSaved: (val) => setState(() => encode.name = val),
            ),
            TextFormField(
              initialValue: encode.comment,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'Comment for your encode'),
              onSaved: (val) => setState(() => encode.comment = val),
            ),
            DropdownButtonFormField(
              items: Encode.recommends.map((itm) {
                return new DropdownMenuItem(
                  value: itm,
                  child: new Text(itm),
                );
              }).toList(),
              validator: (value) {
                if (value == null) {
                  return 'This field can not be empty';
                }
                return null;
              },
              value: videoProfileName,
              onChanged: (val) => changedProfile(val),
              decoration: InputDecoration(labelText: 'Choose recommended video profile'),
              onSaved: (val) => setState(() => encode.videoProfileName = val),
            ),
            DropdownButtonFormField(
              items: Constants.packageFormats.entries.map((itm) {
                return new DropdownMenuItem(
                  value: itm.key,
                  child: new Text(itm.value),
                );
              }).toList(),
              value: encode.packagingFormat,
              onChanged: (val) => setState(() => encode.packagingFormat = val),
              decoration: InputDecoration(labelText: 'Packaging format'),
              onSaved: (val) => setState(() => encode.packagingFormat = val),
            ),
            TextFormField(
              initialValue: encode.outputFolder,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'Specify the output folder'),
              onSaved: (val) => setState(() => encode.outputFolder = val),
            ),
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return null;
                }
                if (!Common.isNumeric(value)) {
                  return 'This field must be numeric';
                }
                return null;
              },
              initialValue: encode.autoAudioKbpsPerChannel != null ? encode.autoAudioKbpsPerChannel.toString() : '',
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Auto audio KBPS per channel'),
              onChanged: (val) => setState(() => encode.autoAudioKbpsPerChannel = val != '' ? int.tryParse(val) : null),
              onSaved: (val) => setState(() => encode.autoAudioKbpsPerChannel = val != '' ? int.tryParse(val) : null),
            ),
            audioPanel(),
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
