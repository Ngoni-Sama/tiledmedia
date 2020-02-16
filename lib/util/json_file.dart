import 'dart:io';

import 'package:path_provider/path_provider.dart';

class JsonFile {
  static JsonFile _jsonFile;

  static JsonFile getInstance() {
    if (_jsonFile != null) {
      return _jsonFile;
    }

    _jsonFile = new JsonFile();
    return _jsonFile;
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/data.json');
  }

  Future<String> readData() async {
    try {
      final file = await _localFile;

      // Read the file
      String contents = await file.readAsString();
      return contents;
    } catch (e) {
      // If encountering an error, return 0
      return '';
    }
  }

  Future<File> writeData(String data) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$data');
  }
}
