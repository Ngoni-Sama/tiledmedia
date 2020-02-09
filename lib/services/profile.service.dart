import 'dart:html';

import 'package:tiledmedia/config.dart';
import 'package:tiledmedia/data/models/profile.model.dart';

postProfiles(Profile profile) {
  return HttpRequest.request(Config.apiHost + '/encoding/profiles',
      method: 'POST',
      sendData: profile.getProfileRequestJson(),
      requestHeaders: {
        'Content-Type': 'application/json; charset=UTF-8'
      });
}