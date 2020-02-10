import 'package:tiledmedia/util/globals.dart';

class Setting {

  int customerID;
  String apiAuthToken = '';
  String xAPIKey = '';

  static Setting getInstance() {
    Setting obj = new Setting();
    obj.customerID = Globals.pref.getInt('customer_id');
    obj.apiAuthToken = Globals.pref.getString('api_auth_token') ?? '';
    obj.xAPIKey = Globals.pref.getString('x_api_key') ?? '';
    return obj;
  }

  isConfigured() {
    return customerID != '' && apiAuthToken != '' && xAPIKey != null;
  }

  saveSetting(int customerID, String apiAuthToken, String xAPIKey) async {
    this.customerID = customerID;
    this.apiAuthToken = apiAuthToken;
    this.xAPIKey = xAPIKey;
    await Globals.pref.setInt('customer_id ', customerID );
    await Globals.pref.setString('api_auth_token ', apiAuthToken );
    await Globals.pref.setString('x_api_key ', xAPIKey );
  }
}