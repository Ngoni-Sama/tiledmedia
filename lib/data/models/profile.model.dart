import 'dart:convert';

import 'package:tiledmedia/util/common.dart';
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


  static List<Profile> getAllProfiles() {
    List<String> profiles;
    profiles = Globals.pref.getStringList('profiles');

    List<Profile> result = [];
    for (int i=0; i<profiles.length; i++) {
      Map tmp = json.decode(profiles[i]);
      Profile p = Profile.fromJson(tmp);
      result.add(p);
    }

    return result;
  }

  static getProfileByIndex(int idx) {
    List<Profile> profiles = getAllProfiles();

    if (profiles.length == 0) {
      return null;
    } else {
      return profiles[idx];
    }
  }

  create() {
    List<String> profiles = Globals.pref.getStringList('profiles');

    if (profiles == null) {
      profiles = [];
    }

    Map prof = this.toJson();
    String profileStr = json.encode(prof);
    profiles.add(profileStr);

    Globals.pref.setStringList('profiles', profiles);
  }

  update(int id) {
    List<String> profiles = Globals.pref.getStringList('profiles');

    if (profiles == null) {
      profiles = [];
    }

    profiles.removeAt(id);

    Map prof = this.toJson();
    String profileStr = json.encode(prof);
    profiles.insert(id, profileStr);

    Globals.pref.setStringList('profiles', profiles);
  }

  static deleteByIndex(int id) {
    List<String> profiles = Globals.pref.getStringList('profiles');

    if (profiles == null || profiles.length == 0) {
      return;
    }

    profiles.removeAt(id);

    Globals.pref.setStringList('profiles', profiles);
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
}
