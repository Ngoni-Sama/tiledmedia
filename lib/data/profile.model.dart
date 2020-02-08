import 'package:tiledmedia/util/globals.dart';

class Profile {

  String name;
  String remark;
  int version;
  int width;
  int height;
  int frameRateNumber;
  int frameRateDenom;
  String inProjectionType;
  String outProjectionType;
  String encodeQuality;

  Profile() {
    this.name = '';
    this.remark = '';
    this.version = 1;
    this.width = 1920;
    this.height = 1080;
    this.frameRateNumber = 30000;
    this.frameRateDenom = 1001;
    this.inProjectionType = '360-erp-mono';
    this.outProjectionType = '360-cubemap-mono';
    this.encodeQuality = 'default';
  }

  Map get requestBody {
    Map body = {
      "customer_id": Globals.customerID,
      "api_auth_token": Globals.apiAuthToken,
      "version": this.version,
      "width": this.width,
      "height": this.height,
      "framerate": {
        "num": this.frameRateNumber,
        "denom": this.frameRateDenom
      },
      "in_projection_type": this.inProjectionType,
      "out_projection_type": this.outProjectionType,
      "encode_quality": this.encodeQuality
    };

    return body;
  }

}