import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiledmedia/util/globals.dart';

bool isNumeric(String s) {
  if(s == null) {
    return false;
  }
  return double.tryParse(s) != null;
}

Future<SharedPreferences> initPreferences() async {
  return await SharedPreferences.getInstance();
}