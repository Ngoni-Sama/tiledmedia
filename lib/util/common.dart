import 'package:tiledmedia/data/models/setting.model.dart';
import 'package:tiledmedia/util/globals.dart';
import 'package:tiledmedia/util/json_file.dart';

class Common {
  static Common _common;

  static Common getInstance() {
    if (_common != null) {
      return _common;
    }
    _common = new Common();
    return _common;
  }

  static bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  static initializeApp() async {
    Globals.jsonFile = JsonFile.getInstance();
    Globals.setting = await Setting.getInstance();
  }
}
