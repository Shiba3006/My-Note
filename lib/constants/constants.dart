import 'package:hive/hive.dart';

import '../models/note_model.dart';

const notesBox = 'notes_box';
const colorBox = 'colors_box';

late Box<NoteModel> myBox;
late Box<int> myColorBox;

int createUniqueId (){
  return DateTime.now().millisecondsSinceEpoch.remainder(100000);
}


