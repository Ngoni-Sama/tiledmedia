import 'package:tiledmedia/data/models/setting.model.dart';
import 'package:tiledmedia/util/globals.dart';
import 'package:tiledmedia/util/json_file.dart';

class Common {
  // check if string is numberic value
  static bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  // prepare json file and setting data
  static initializeApp() async {
    Globals.jsonFile = JsonFile.getInstance();
    Globals.setting = await Setting.getInstance();
  }
}
