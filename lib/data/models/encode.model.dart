import 'package:tiledmedia/data/models/profile.model.dart';

class Encode {
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
  bool autoAudioKbpsPerChannel;

  Encode() {
    // initialize properties
    width = 1920;
    height = 1080;
    frameRateNumber = 30000;
    frameRateDenom = 1001;
    autoAudioKbpsPerChannel = false;
  }
}