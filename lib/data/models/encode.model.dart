import 'package:tiledmedia/data/models/profile.model.dart';

class Encode {

  static List<dynamic> recommends = [];

  int width;
  int height;
  int frameRateNumber;
  int frameRateDenom;
  Profile chosenProfile;

  String videoProfileName;
  String name;
  String comment;
  String packagingFormat;
  String outputFolder;
  int autoAudioKbpsPerChannel;
  int independentAudioFileIndex;
  int embeddedTrackIndex;
  String trackName;
  String language;
  String spatialAudio;
  int targetBitrate;
  String audioCodec;

  String srcFile;
  String secondaryFile;
  bool imageSequence;
  bool rawYUV;
  int startingIndex;
  String yuvFormat;
  String audioSrcFile;
  String folder;
  String url;
  bool acceptInputFailures;

  Encode() {
    // initialize properties
    width = 1920;
    height = 1080;
    frameRateNumber = 30000;
    frameRateDenom = 1001;

    name = '';
    comment = '';
    packagingFormat = '';
    outputFolder = '';
    outputFolder = '';
    autoAudioKbpsPerChannel = 0;
    independentAudioFileIndex = 0;
    embeddedTrackIndex = 0;
    trackName = '';
    language = 'en';
    spatialAudio = '';
    audioCodec = 'aac';

    srcFile = '';
    secondaryFile = '';
    imageSequence = false;
    rawYUV = false;
    startingIndex = 0;
    yuvFormat = '';
    audioSrcFile = '';
    folder = '';
    url = '';
    acceptInputFailures = false;
  }
}