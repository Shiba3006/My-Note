import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_note/cubits/main_cubit.dart';
import 'package:my_note/models/note_model.dart';
import 'package:my_note/views/notes_view.dart';


import 'constants/colors.dart';
import 'constants/constants.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/bloc_observer.dart';


void main() async {
  Bloc.observer = MyBlocObserver();

  await Hive.initFlutter();
  await Hive.openBox(notesBox);
  Hive.registerAdapter(NoteModelAdapter());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: primaryColor[50],
          fontFamily: 'Poppins',
          colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
          useMaterial3: true,
        ),
        home: const NotesView(),
      ),
    );
  }
}
