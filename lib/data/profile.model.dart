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

  String srcLocType;
  Map srcCredentials;
  String destLocType;
  Map destCredentials;

  Profile() {
    // Profile details
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

    // Source location details
    this.srcLocType = 's3bucket';
    this.srcCredentials = {
      's3bucket': {
        'region': 'us-east-2',
        'custom_endpoint': '',
        'bucket': '',
        'access_key_id': '',
        'secret_access_key': '',
      },
      'azure-blob': {
        'account_name': '',
        'account_key': '',
        'container': '',
      },
      'http-pull': {},
    };

    // Destination local details
    this.destLocType = 's3bucket';
    this.destCredentials = {
      's3bucket': {
        'region': '',
        'custom_endpoint': '',
        'bucket': '',
        'access_key_id': '',
        'secret_access_key': '',
      },
      'azure-blob': {
        'account_name': '',
        'account_key': '',
        'container': '',
      },
      'wangsu': {
        'host': '',
        'token': '',
        'path': '',
      },
      'akamai_ns': {
        'host': '',
        'keyname': '',
        'key': '',
        'cpcode': '',
        'path': '',
      }
    };
  }

  Map get requestProfileBody {
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