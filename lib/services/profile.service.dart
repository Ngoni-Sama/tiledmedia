import 'dart:html';

import 'package:tiledmedia/config.dart';
import 'package:tiledmedia/data/models/profile.model.dart';

class ProfileService {

  static ProfileService _profileService;

  static ProfileService getInstance() {
    if (_profileService != null) {
      return _profileService;
    }

    _profileService = new ProfileService();
    return _profileService;
  }

  postProfiles(Profile profile) {
    return HttpRequest.request(Config.apiHost + '/encoding/profiles',
        method: 'POST',
//      sendData: profile.getProfileRequestJson(),
        requestHeaders: {
          'Content-Type': 'application/json; charset=UTF-8'
        });
  }
}