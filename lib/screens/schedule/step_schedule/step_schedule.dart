import 'package:flutter/material.dart';
import 'package:tiledmedia/data/models/encode.model.dart';
import 'package:tiledmedia/data/models/profile.model.dart';
import 'package:tiledmedia/services/encode.service.dart';
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
  Profile profile;
  String encodeUUID;

  EncodeService _encodeService = EncodeService.getInstance();

  _StepScheduleState(encode, onNext, onPrev) {
    this.encode = encode;
    this.onNext = onNext;
    this.onPrev = onPrev;
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      profile = encode.chosenProfile;
    });
  }

  onSubmit() {
    _encodeService.scheduleEncode(encode).then((value) {
      if (value != null) {
        setState(() {
          encodeUUID = value;
        });
        startProgress();
      }
    });
  }

  startProgress() {

  }

  onCancel() {
    _encodeService.cancelSchedule(encodeUUID).then((value) {
      if (value != null) {
        setState(() {
          encodeUUID = null;
        });
      }
    });
  }

  sourceVideoDetails() {
    switch (profile.srcLocType) {
      case 's3bucket':
        return <Widget>[
          Container(child: Column(children: <Widget>[Text('Source Location'), Text('S3 Bucket', style: AppStyles.boldTextStyle)])),
          Container(child: Column(children: <Widget>[Text('Region'), Text(profile.srcCredentials['s3bucket']['region'], style: AppStyles.boldTextStyle)])),
          Container(child: Column(children: <Widget>[Text('Custom Endpoint'), Text(profile.srcCredentials['s3bucket']['custom_endpoint'], style: AppStyles.boldTextStyle)])),
          Container(child: Column(children: <Widget>[Text('Bucket'), Text(profile.srcCredentials['s3bucket']['bucket'], style: AppStyles.boldTextStyle)])),
          Container(child: Column(children: <Widget>[Text('Access Key ID'), Text(profile.srcCredentials['s3bucket']['access_key_id'], style: AppStyles.boldTextStyle)])),
          Container(child: Column(children: <Widget>[Text('Secret Access Key'), Text(profile.srcCredentials['s3bucket']['secret_access_key'], style: AppStyles.boldTextStyle)])),
        ];
      case 'azure-blob':
        return <Widget>[
          Container(child: Column(children: <Widget>[Text('Source Location'), Text('Azure Blob', style: AppStyles.boldTextStyle)])),
          Container(child: Column(children: <Widget>[Text('Account Name'), Text(profile.srcCredentials['azure-blob']['account_name'], style: AppStyles.boldTextStyle)])),
          Container(child: Column(children: <Widget>[Text('Account Key'), Text(profile.srcCredentials['azure-blob']['account_key'], style: AppStyles.boldTextStyle)])),
          Container(child: Column(children: <Widget>[Text('Container'), Text(profile.srcCredentials['azure-blob']['container'], style: AppStyles.boldTextStyle)])),
        ];
    }
    return <Widget>[
      Container(child: Column(children: <Widget>[Text('Source Location'), Text('HTTP-PULL', style: AppStyles.boldTextStyle)])),
      Container(child: Column(children: <Widget>[Text('Source URL'), Text(encode.srcFile, style: AppStyles.boldTextStyle)])),
    ];
  }

  destinationVideoDetails() {
    switch (profile.destLocType) {
      case 's3bucket':
        return <Widget>[
          Container(child: Column(children: <Widget>[Text('Destination Location'), Text('S3 Bucket', style: AppStyles.boldTextStyle)])),
          Container(child: Column(children: <Widget>[Text('Region'), Text(profile.destCredentials['s3bucket']['region'], style: AppStyles.boldTextStyle)])),
          Container(child: Column(children: <Widget>[Text('Custom Endpoint'), Text(profile.destCredentials['s3bucket']['custom_endpoint'], style: AppStyles.boldTextStyle)])),
          Container(child: Column(children: <Widget>[Text('Bucket'), Text(profile.destCredentials['s3bucket']['bucket'], style: AppStyles.boldTextStyle)])),
          Container(child: Column(children: <Widget>[Text('Access Key ID'), Text(profile.destCredentials['s3bucket']['access_key_id'], style: AppStyles.boldTextStyle)])),
          Container(child: Column(children: <Widget>[Text('Secret Access Key'), Text(profile.destCredentials['s3bucket']['secret_access_key'], style: AppStyles.boldTextStyle)])),
        ];
      case 'azure-blob':
        return <Widget>[
          Container(child: Column(children: <Widget>[Text('Destination Location'), Text('Azure Blob', style: AppStyles.boldTextStyle)])),
          Container(child: Column(children: <Widget>[Text('Account Name'), Text(profile.destCredentials['azure-blob']['account_name'], style: AppStyles.boldTextStyle)])),
          Container(child: Column(children: <Widget>[Text('Account Key'), Text(profile.destCredentials['azure-blob']['account_key'], style: AppStyles.boldTextStyle)])),
          Container(child: Column(children: <Widget>[Text('Container'), Text(profile.destCredentials['azure-blob']['container'], style: AppStyles.boldTextStyle)])),
        ];
      case 'wangsu':
        return <Widget>[
          Container(child: Column(children: <Widget>[Text('Destination Location'), Text('Wangsu', style: AppStyles.boldTextStyle)])),
          Container(child: Column(children: <Widget>[Text('Host'), Text(profile.destCredentials['wangsu']['host'], style: AppStyles.boldTextStyle)])),
          Container(child: Column(children: <Widget>[Text('Token'), Text(profile.destCredentials['wangsu']['token'], style: AppStyles.boldTextStyle)])),
          Container(child: Column(children: <Widget>[Text('Path'), Text(profile.destCredentials['wangsu']['path'], style: AppStyles.boldTextStyle)])),
        ];
      case 'akamai-ns':
        return <Widget>[
          Container(child: Column(children: <Widget>[Text('Destination Location'), Text('Akamai ns', style: AppStyles.boldTextStyle)])),
          Container(child: Column(children: <Widget>[Text('Host'), Text(profile.destCredentials['akamai-ns']['host'], style: AppStyles.boldTextStyle)])),
          Container(child: Column(children: <Widget>[Text('Key Name'), Text(profile.destCredentials['akamai-ns']['keyname'], style: AppStyles.boldTextStyle)])),
          Container(child: Column(children: <Widget>[Text('Key'), Text(profile.destCredentials['akamai-ns']['key'], style: AppStyles.boldTextStyle)])),
          Container(child: Column(children: <Widget>[Text('Cpcode'), Text(profile.destCredentials['akamai-ns']['cpcode'], style: AppStyles.boldTextStyle)])),
          Container(child: Column(children: <Widget>[Text('path'), Text(profile.destCredentials['akamai-ns']['path'], style: AppStyles.boldTextStyle)])),
        ];
    }
    return <Widget>[
      Container(child: Column(children: <Widget>[Text('Destination Location'), Text('HTTP-PUT', style: AppStyles.boldTextStyle)])),
      Container(child: Column(children: <Widget>[Text('Output File'), Text(encode.url, style: AppStyles.boldTextStyle)])),
    ];
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
              padding: EdgeInsets.only(bottom: 16),
              child: Text(
                'Video Encoding Configuration',
                style: TextStyle(color: Colors.blueAccent, fontSize: 16),
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.greenAccent),
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(child: Column(children: <Widget>[Text('Video profile name'), Text(encode.videoProfileName, style: AppStyles.boldTextStyle)])),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.greenAccent),
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(child: Column(children: <Widget>[Text('Version'), Text(profile.version.toString(), style: AppStyles.boldTextStyle)])),
                  Container(child: Column(children: <Widget>[Text('Input Projection'), Text(profile.inProjectionType, style: AppStyles.boldTextStyle)])),
                  Container(child: Column(children: <Widget>[Text('Output Projection'), Text(profile.outProjectionType, style: AppStyles.boldTextStyle)])),
                  Container(child: Column(children: <Widget>[Text('Framerate(num)'), Text(encode.frameRateNumber.toString(), style: AppStyles.boldTextStyle)])),
                  Container(child: Column(children: <Widget>[Text('Framerate(denom)'), Text(encode.frameRateDenom.toString(), style: AppStyles.boldTextStyle)])),
                  profile.version >= 2
                      ? Container(child: Column(children: <Widget>[Text('Encode Quality'), Text(profile.encodeQuality, style: AppStyles.boldTextStyle)]))
                      : Container(),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.greenAccent),
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: sourceVideoDetails(),
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.greenAccent),
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(child: Column(children: <Widget>[Text('Source File'), Text(encode.srcFile, style: AppStyles.boldTextStyle)])),
                  profile.inProjectionType == '360-erp-stereo-split-file'
                      ? Container(child: Column(children: <Widget>[Text('Secondary Src File'), Text(encode.secondaryFile, style: AppStyles.boldTextStyle)]))
                      : Container(),
                  encode.imageSequence
                      ? Container(child: Column(children: <Widget>[Text('Image Sequence'), Text(encode.imageSequence.toString(), style: AppStyles.boldTextStyle)]))
                      : Container(),
                  encode.imageSequence
                      ? Container(child: Column(children: <Widget>[Text('Starting Index'), Text(encode.startingIndex.toString(), style: AppStyles.boldTextStyle)]))
                      : Container(),
                  encode.rawYUV ? Container(child: Column(children: <Widget>[Text('Raw YUV'), Text(encode.rawYUV.toString(), style: AppStyles.boldTextStyle)])) : Container(),
                  encode.rawYUV ? Container(child: Column(children: <Widget>[Text('YUV Format'), Text(encode.yuvFormat, style: AppStyles.boldTextStyle)])) : Container(),
                  encode.rawYUV ? Container(child: Column(children: <Widget>[Text('Width'), Text(encode.width.toString(), style: AppStyles.boldTextStyle)])) : Container(),
                  encode.rawYUV ? Container(child: Column(children: <Widget>[Text('Height'), Text(encode.height.toString(), style: AppStyles.boldTextStyle)])) : Container(),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.greenAccent),
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  encode.packagingFormat != ''
                      ? Container(child: Column(children: <Widget>[Text('Packaging Format'), Text(encode.packagingFormat, style: AppStyles.boldTextStyle)]))
                      : Container(),
                  encode.outputFolder != ''
                      ? Container(child: Column(children: <Widget>[Text('Output Folder'), Text(encode.outputFolder, style: AppStyles.boldTextStyle)]))
                      : Container(),
                  Container(child: Column(children: <Widget>[Text('Audio Src File'), Text(encode.audioSrcFile, style: AppStyles.boldTextStyle)])),
                ],
              ),
            ),
            encode.autoAudioKbpsPerChannel != null
                ? Container(
                    decoration: BoxDecoration(color: Colors.greenAccent),
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        encode.independentAudioFileIndex != null
                            ? Container(
                                child: Column(
                                    children: <Widget>[Text('Independent Audio File Index'), Text(encode.independentAudioFileIndex.toString(), style: AppStyles.boldTextStyle)]))
                            : Container(),
                        encode.embeddedTrackIndex != null
                            ? Container(child: Column(children: <Widget>[Text('Embedded Track Index'), Text(encode.embeddedTrackIndex.toString(), style: AppStyles.boldTextStyle)]))
                            : Container(),
                        encode.trackName != ''
                            ? Container(child: Column(children: <Widget>[Text('Track Name'), Text(encode.trackName, style: AppStyles.boldTextStyle)]))
                            : Container(),
                        encode.language != '' ? Container(child: Column(children: <Widget>[Text('Language'), Text(encode.language, style: AppStyles.boldTextStyle)])) : Container(),
                        encode.spatialAudio != ''
                            ? Container(child: Column(children: <Widget>[Text('Spatial Audio'), Text(encode.spatialAudio, style: AppStyles.boldTextStyle)]))
                            : Container(),
                        Container(child: Column(children: <Widget>[Text('Target bitrate'), Text(encode.targetBitrate.toString(), style: AppStyles.boldTextStyle)])),
                        Container(child: Column(children: <Widget>[Text('Audio Codec'), Text(encode.audioCodec, style: AppStyles.boldTextStyle)])),
                      ],
                    ),
                  )
                : Container(),
            Container(
              decoration: BoxDecoration(color: Colors.greenAccent),
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: destinationVideoDetails() +
                    <Widget>[
                      Container(child: Column(children: <Widget>[Text('Folder'), Text(encode.folder, style: AppStyles.boldTextStyle)])),
                      profile.destLocType == 'http-put'
                          ? Container(child: Column(children: <Widget>[Text('Folder'), Text(encode.folder, style: AppStyles.boldTextStyle)]))
                          : Container(),
                    ],
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.greenAccent),
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(child: Column(children: <Widget>[Text('Notification Type'), Text(profile.notificationType, style: AppStyles.boldTextStyle)])),
                  Container(
                      child: Column(children: <Widget>[Text('Target'), Text(profile.notificationType == 'mail' ? profile.mail : profile.webhook, style: AppStyles.boldTextStyle)])),
                  Container(child: Column(children: <Widget>[Text('Accept Input Failures'), Text(encode.acceptInputFailures.toString(), style: AppStyles.boldTextStyle)])),
                ],
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
                  encodeUUID == null
                      ? new PrimaryButton(
                          onPressed: onSubmit,
                          buttonName: 'Start Encode',
                        )
                      : new PrimaryButton(
                          onPressed: onCancel,
                          buttonName: 'Cancel Schedule',
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
