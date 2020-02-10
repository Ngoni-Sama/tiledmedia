import 'dart:convert';

import 'package:tiledmedia/data/models/profile.model.dart';
import 'package:tiledmedia/util/common.dart';
import 'package:tiledmedia/util/globals.dart';

Future<List<Profile>> getAllProfiles() async {
  List<String> profiles;
  if (Globals.pref == null) {
    Globals.pref = await initPreferences();
  }
  profiles = Globals.pref.getStringList('profiles');

  List<Profile> result = [];
  for (int i=0; i<profiles.length; i++) {
    Map tmp = json.decode(profiles[i]);
    Profile p = Profile.fromJson(tmp);
    result.add(p);
  }

  return result;
}

createProfile(Profile profile) async {
  List<String> profiles = Globals.pref.getStringList('profiles');

  if (profiles == null) {
    profiles = [];
  }

  Map prof = profile.toJson();
  String profileStr = json.encode(prof);
  profiles.add(profileStr);

  await Globals.pref.setStringList('profiles', profiles);
}

updateProfile(int id, Profile profile) async {
  List<String> profiles = Globals.pref.getStringList('profiles');

  if (profiles == null) {
    profiles = [];
  }

  profiles.removeAt(id);

  Map prof = profile.toJson();
  String profileStr = json.encode(prof);
  profiles.insert(id, profileStr);

  await Globals.pref.setStringList('profiles', profiles);
}

deleteProfile(int id) async {
  List<String> profiles = Globals.pref.getStringList('profiles');

  if (profiles == null || profiles.length == 0) {
    return;
  }

  profiles.removeAt(id);

  await Globals.pref.setStringList('profiles', profiles);
}

getProfileByIndex(int id) async {
  List<Profile> profiles = await getAllProfiles();

  if (profiles.length == 0) {
    return null;
  } else {
    return profiles[id];
  }
}