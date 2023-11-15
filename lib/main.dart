import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_note/cubits/main_cubit.dart';
import 'package:my_note/views/notes_view.dart';

import 'cashe_helper.dart';
import 'constants/constants.dart';
import 'cubits/bloc_observer.dart';
import 'models/note_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();

  Hive.registerAdapter(NoteModelAdapter());
  await Hive.initFlutter();
  myBox = await Hive.openBox<NoteModel>(notesBox);
  
  await CacheHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit()..getNotes(),
      child: BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              // scaffoldBackgroundColor: primaryColor[50],
              fontFamily: 'Poppins',
              colorScheme: ColorScheme.fromSeed(
                  seedColor: MainCubit.get(context).currentColor),
              useMaterial3: true,
            ),
            home: const NotesView(),
          );
        },
      ),
    );
  }
}
