import 'dart:ui';

import 'package:hive/hive.dart';

import '../models/note_model.dart';

const notesBox = 'notes_box';
const colorBox = 'colors_box';
const noteColorBox = 'note_colors_box';

late Box<NoteModel> myBox;
late Box<int> myColorBox;
late Box<int> myNoteColorBox;

