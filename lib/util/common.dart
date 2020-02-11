import 'package:shared_preferences/shared_preferences.dart';

bool isNumeric(String s) {
  if(s == null) {
    return false;
  }
  return double.tryParse(s) != null;
}

Future<SharedPreferences> initPreferences() async {
  return await SharedPreferences.getInstance();
}