
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_note/constans/constans.dart';
import 'package:my_note/models/note_model.dart';
import 'package:my_note/views/notes_view.dart';

import 'constans/colors.dart';



void main() async {

  await Hive.initFlutter();
  await Hive.openBox(notesBox);
  Hive.registerAdapter(NoteModelAdapter());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
      ),
      home: const NotesView(),
    );
  }
}
