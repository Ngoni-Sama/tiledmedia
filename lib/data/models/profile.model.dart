import 'dart:convert';

import 'package:tiledmedia/util/globals.dart';

class Profile {
  String name;
  String remark;
  int version;
  String inProjectionType;
  String outProjectionType;
  String encodeQuality;

  String srcLocType;
  Map srcCredentials;
  String destLocType;
  Map destCredentials;
  String url;
  String notificationType;
  String webhook;
  String mail;

  Profile() {
    // Profile details
    this.name = '';
    this.remark = '';
    this.version = 1;
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
      'wangsu': {
        'host': '',
        'token': '',
        'path': '',
      },
      'akamai-ns': {
        'host': '',
        'keyname': '',
        'key': '',
        'cpcode': '',
        'path': '',
      }
    };
    this.url = '';
    this.notificationType = 'mail';
    this.webhook = '';
    this.mail = '';
  }

  Profile.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        remark = json['remark'],
        version = json['version'],
        inProjectionType = json['inProjectionType'],
        outProjectionType = json['outProjectionType'],
        encodeQuality = json['encodeQuality'],
        srcLocType = json['srcLocType'],
        srcCredentials = json['srcCredentials'],
        destLocType = json['destLocType'],
        destCredentials = json['destCredentials'],
        url = json['url'],
        notificationType = json['notificationType'],
        webhook = json['webhook'],
        mail = json['mail'];

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'remark': remark,
      'version': version,
      'inProjectionType': inProjectionType,
      'outProjectionType': outProjectionType,
      'encodeQuality': encodeQuality,
      'srcLocType': srcLocType,
      'srcCredentials': srcCredentials,
      'destLocType': destLocType,
      'destCredentials': destCredentials,
      'url': url,
      'notificationType': notificationType,
      'webhook': webhook,
      'mail': mail,
    };
  }

  String getProfileRequestJson() {
    final body = {
      "customer_id": Globals.customerID,
      "api_auth_token": Globals.apiAuthToken,
      "version": version,
      "in_projection_type": inProjectionType,
      "out_projection_type": outProjectionType,
      "encode_quality": encodeQuality
    };
    return json.encode(body);
  }
}
