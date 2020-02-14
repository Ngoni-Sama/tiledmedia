import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:tiledmedia/config.dart';
import 'package:tiledmedia/data/models/encode.model.dart';
import 'package:tiledmedia/util/globals.dart';

class ProfileService {
  static ProfileService _profileService;

  static ProfileService getInstance() {
    if (_profileService != null) {
      return _profileService;
    }

    _profileService = new ProfileService();
    return _profileService;
  }

  Future<List<dynamic>> postProfiles(Encode encode) async {

    String body = jsonEncode({
      "customer_id": Globals.setting.customerID,
      "api_auth_token": Globals.setting.apiAuthToken,
      "version": encode.chosenProfile.version,
      "width": encode.width,
      "height": encode.height,
      "framerate": {"num": encode.frameRateNumber, "denom": encode.frameRateDenom},
      "in_projection_type": encode.chosenProfile.inProjectionType,
      "out_projection_type": encode.chosenProfile.outProjectionType,
      "encode_quality": encode.chosenProfile.encodeQuality
    });
    String url = Config.apiHost + '/encoding/profiles';
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'x-api-key': Globals.setting.xAPIKey,
    };
    var response = await http.post(url, headers: headers, body: body);
    if (response.statusCode == 200) {
      Map res = jsonDecode(response.body);
      return res['profiles'];
    }
    return [];
  }
}
