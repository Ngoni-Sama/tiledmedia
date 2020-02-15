import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:tiledmedia/config.dart';
import 'package:tiledmedia/data/models/encode.model.dart';
import 'package:tiledmedia/data/models/profile.model.dart';
import 'package:tiledmedia/util/globals.dart';

class EncodeService {
  static EncodeService _encodeService;

  static EncodeService getInstance() {
    if (_encodeService != null) {
      return _encodeService;
    }

    _encodeService = new EncodeService();
    return _encodeService;
  }

  Future<String> scheduleEncode(Encode encode) async {
    Profile profile = encode.chosenProfile;
    Map body = {
      "customer_id": Globals.setting.customerID,
      "api_auth_token": Globals.setting.apiAuthToken,
      "name": encode.name,
      "comment": encode.comment,
      "source": {
        "ingest": {},
        "video": {
          "src_file": encode.srcFile,
          "secondary_src_file": encode.secondaryFile,
          "projection_type": profile.inProjectionType,
          "image_sequence": encode.imageSequence,
          "starting_index": encode.startingIndex,
          "raw_yuv": encode.rawYUV,
          "framerate": {"num": encode.frameRateNumber, "denom": encode.frameRateDenom},
          "width": encode.width,
          "height": encode.height,
          "yuv_format": encode.yuvFormat
        },
        "audio": [
          {"src_file": encode.audioSrcFile}
        ]
      },
      "encoding": [
        encode.autoAudioKbpsPerChannel > 0
            ? {
                "video_profile_name": encode.videoProfileName,
                "packaging_format": encode.packagingFormat,
                "output_folder": encode.outputFolder,
                "auto_audio_kbps_per_channel": encode.autoAudioKbpsPerChannel,
              }
            : {
                "video_profile_name": encode.videoProfileName,
                "packaging_format": encode.packagingFormat,
                "output_folder": encode.outputFolder,
                "auto_audio_kbps_per_channel": encode.autoAudioKbpsPerChannel,
                "audio": [
                  encode.independentAudioFileIndex != 0
                      ? {
                          "independent_audio_file_index": encode.independentAudioFileIndex,
                          "track_name": encode.trackName,
                          "language": encode.language,
                          "spatial_audio": encode.spatialAudio,
                          "target_bitrate_in_kbps": encode.targetBitrate,
                          "audio_codec": "aac"
                        }
                      : {
                          "embedded_track_index": encode.embeddedTrackIndex,
                          "track_name": encode.trackName,
                          "language": encode.language,
                          "spatial_audio": encode.spatialAudio,
                          "target_bitrate_in_kbps": encode.targetBitrate,
                          "audio_codec": "aac"
                        }
                ]
              }
      ],
      "output": {},
      "notification": {"type": profile.notificationType, "target": profile.notificationType == 'mail' ? profile.mail : profile.webhook},
      "advanced": {"accept_input_failures": encode.acceptInputFailures}
    };

    switch (profile.srcLocType) {
      case 's3bucket':
        body['source']['ingest'] = {
          "type": profile.srcLocType,
          "s3": {
            "region": profile.srcCredentials['s3bucket']['region'],
            "custom_endpoint": profile.srcCredentials['s3bucket']['custom_endpoint'],
            "bucket": profile.srcCredentials['s3bucket']['bucket'],
            "access_key_id": profile.srcCredentials['s3bucket']['access_key_id'],
            "secret_access_key": profile.srcCredentials['s3bucket']['secret_access_key'],
          }
        };
        break;
      case 'azure-blob':
        body['source']['ingest'] = {
          "type": profile.srcLocType,
          "azure_blob": {
            "account_name": profile.srcCredentials['azure-blob']['account_name'],
            "account_key": profile.srcCredentials['azure-blob']['account_key'],
            "container": profile.srcCredentials['azure-blob']['container']
          }
        };
        break;
      case 'gcp-storage':
        body['source']['ingest'] = {
          "type": profile.srcLocType,
          "gcp_storage": {"bucket": "string", "service_account_credentials_b64": "service_credential"}
        };
        break;
      case 'http-pull':
        body['source']['ingest'] = {
          "type": profile.srcLocType,
        };
        break;
    }

    switch (profile.destLocType) {
      case 's3bucket':
        body['output'] = {
          "type": profile.destLocType,
          "folder": encode.folder,
          "s3": {
            "region": profile.destCredentials['s3bucket']['region'],
            "custom_endpoint": profile.destCredentials['s3bucket']['custom_endpoint'],
            "bucket": profile.destCredentials['s3bucket']['bucket'],
            "access_key_id": profile.destCredentials['s3bucket']['access_key_id'],
            "secret_access_key": profile.destCredentials['s3bucket']['secret_access_key'],
          }
        };
        break;
      case 'azure-blob':
        body['output'] = {
          "type": profile.destLocType,
          "folder": encode.folder,
          "url": encode.url,
          "azure_blob": {
            "account_name": profile.destCredentials['azure-blob']['account_name'],
            "account_key": profile.destCredentials['azure-blob']['account_key'],
            "container": profile.destCredentials['azure-blob']['container']
          },
        };
        break;
      case 'wangsu':
        body['output'] = {
          "type": profile.destLocType,
          "folder": encode.folder,
          "wangsu": {"host": profile.destCredentials['wangsu']['host'], "token": profile.destCredentials['wangsu']['token'], "path": profile.destCredentials['wangsu']['path']},
        };
        break;
      case 'akamai-ns':
        body['output'] = {
          "type": profile.destLocType,
          "folder": encode.folder,
          "akamai_ns": {
            "host": profile.destCredentials['akamai-ns']['host'],
            "keyname": profile.destCredentials['akamai-ns']['keyname'],
            "key": profile.destCredentials['akamai-ns']['key'],
            "cpcode": profile.destCredentials['akamai-ns']['cpcode'],
            "path": profile.destCredentials['akamai-ns']['path']
          }
        };
        break;
      case 'http-put':
        body['output'] = {
          "type": profile.destLocType,
          "folder": encode.folder,
          "url": encode.url,
        };
        break;
    }

    String request = jsonEncode(body);
    String url = Config.apiHost + '/encoding/schedule';
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'x-api-key': Globals.setting.xAPIKey,
    };
    var response = await http.post(url, headers: headers, body: request);
    if (response.statusCode == 200) {
      Map res = jsonDecode(response.body);
      return res['encode_uuid'];
    }
    return null;
  }

  Future<String> cancelSchedule(String encodeUUID) async {
    String request = jsonEncode({
      "customer_id": Globals.setting.customerID,
      "api_auth_token": Globals.setting.apiAuthToken,
      "encode_uuid": encodeUUID,
    });
    String url = Config.apiHost + '/encoding/cancel';
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'x-api-key': Globals.setting.xAPIKey,
    };
    var response = await http.post(url, headers: headers, body: request);
    if (response.statusCode == 200) {
      return 'true';
    }
    return null;
  }
}
