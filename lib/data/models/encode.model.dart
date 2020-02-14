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
  String independentAudioFileIndex;
  String embeddedTrackIndex;
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
    language = 'en';
    audioCodec = 'aac';
    imageSequence = false;
    rawYUV = false;
    acceptInputFailures = false;
  }
}