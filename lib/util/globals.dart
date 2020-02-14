import 'package:tiledmedia/data/models/setting.model.dart';
import 'package:tiledmedia/util/json_file.dart';

class Globals {

  static Setting setting;
  static JsonFile jsonFile;
  static int profileFormMode = -1;    // -1: create, 0~: editing id

}