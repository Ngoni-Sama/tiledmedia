import 'dart:convert';

import 'package:tiledmedia/util/globals.dart';

class Setting {
  static Setting _setting;
  int customerID;
  String apiAuthToken = '';
  String xAPIKey = '';

  static Future<Setting> getInstance() async {
    if (_setting != null) {
      return _setting;
    }

    String data = await Globals.jsonFile.readData();
    Map jsonData = data == '' ? {} : json.decode(data) ;
    Map setting = jsonData['setting'] ?? {};

    _setting = new Setting();
    _setting.customerID = setting['customerID'] ?? null;
    _setting.apiAuthToken = setting['apiAuthToken'] ?? '';
    _setting.xAPIKey = setting['xAPIKey'] ?? '';
    return _setting;
  }

  isConfigured() {
    return customerID != null && apiAuthToken != '' && xAPIKey != '';
  }

  saveSetting(int customerID, String apiAuthToken, String xAPIKey) async {
    this.customerID = customerID;
    this.apiAuthToken = apiAuthToken;
    this.xAPIKey = xAPIKey;

    String data = await Globals.jsonFile.readData();
    Map jsonData = data == '' ? {} : json.decode(data) ;
    Map setting = jsonData['setting'] ?? {};

    setting['customerID'] = customerID;
    setting['apiAuthToken'] = apiAuthToken;
    setting['xAPIKey'] = xAPIKey;

    jsonData['setting'] = setting;

    Globals.jsonFile.writeData(json.encode(jsonData));
  }
}
