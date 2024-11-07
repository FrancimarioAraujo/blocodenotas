import 'dart:io';
import 'package:blocodenotas/models/note_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:path_provider/path_provider.dart';

class DbConfigUtil {
  Future<void> start() async {
    Directory dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    Hive.initFlutter('hive_db');
    _registerAdapters();
  }

  void _registerAdapters() {
    Hive.registerAdapter<NoteModel>(NoteModelAdapter());
  }
}
