import 'package:tiledmedia/data/models/profile.model.dart';

class Encode {
  static List<dynamic> recommends = [];

  // profile with input and output configurations
  Profile chosenProfile;

  //encoding properties
  String videoProfileName;
  String name;
  String comment;
  String packagingFormat;
  String outputFolder;

  // Audio properties
  int autoAudioKbpsPerChannel;
  int independentAudioFileIndex;
  int embeddedTrackIndex;
  String trackName;
  String language;
  String spatialAudio;
  int targetBitrate;
  String audioCodec;

  // input video properties
  String srcFile;
  String secondaryFile;
  bool imageSequence;
  bool rawYUV;
  int width;
  int height;
  int frameRateNumber;
  int frameRateDenom;
  int startingIndex;
  String yuvFormat;
  String audioSrcFile;

  // output properties
  String folder;
  String url;

  // advanced
  bool acceptInputFailures;

  Encode() {
    name = '';
    comment = '';
    packagingFormat = '';
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
    width = 1920;
    height = 1080;
    frameRateNumber = 30000;
    frameRateDenom = 1001;
    startingIndex = 0;
    yuvFormat = '';
    audioSrcFile = '';

    folder = '';
    url = '';

    acceptInputFailures = false;
  }
}
