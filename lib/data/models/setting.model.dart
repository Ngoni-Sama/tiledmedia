import 'package:tiledmedia/util/globals.dart';

class Setting {

  static Setting _setting;
  int customerID;
  String apiAuthToken = '';
  String xAPIKey = '';

  static Setting getInstance() {
    if (_setting != null) {
      return _setting;
    }

    _setting = new Setting();
    _setting.customerID = Globals.pref.getInt('customer_id');
    _setting.apiAuthToken = Globals.pref.getString('api_auth_token') ?? '';
    _setting.xAPIKey = Globals.pref.getString('x_api_key') ?? '';
    return _setting;
  }

  isConfigured() {
    return customerID != null && apiAuthToken != '' && xAPIKey != '';
  }

  saveSetting(int customerID, String apiAuthToken, String xAPIKey) {
    this.customerID = customerID;
    this.apiAuthToken = apiAuthToken;
    this.xAPIKey = xAPIKey;
    Globals.pref.setInt('customer_id ', customerID );
    Globals.pref.setString('api_auth_token ', apiAuthToken );
    Globals.pref.setString('x_api_key ', xAPIKey );
  }
}