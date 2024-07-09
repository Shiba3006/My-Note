import 'package:hive/hive.dart';
import 'package:my_note/models/note_model.dart';

import '../constants/constants.dart';

class HiveService {
  static Future<void> init() async {
    myBox = await Hive.openBox<NoteModel>(notesBox);
    myColorBox = await Hive.openBox<int>(colorBox);
  }
}
