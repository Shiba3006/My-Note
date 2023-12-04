import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_note/cubits/notes_cubit.dart';
import 'package:my_note/views/notes_view.dart';
import 'constants/constants.dart';
import 'cubits/bloc_observer.dart';
import 'models/note_model.dart';
import 'notification_service/notification_sevice.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();

  // set the icon to null if you want to use the default app icon
  await NotificationServices.initializeNotification();

  Hive.registerAdapter(NoteModelAdapter());
  await Hive.initFlutter();
  myBox = await Hive.openBox<NoteModel>(notesBox);
  myColorBox = await Hive.openBox<int>(colorBox);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit()
        ..getNotes()
        ..getAppColor(),
      child: BlocConsumer<NotesCubit, NotesStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: 'Poppins',
              colorScheme: ColorScheme.fromSeed(
                seedColor: NotesCubit.get(context).currentColor ,
              ),
              useMaterial3: true,
            ),
            home: const NotesView(),
          );
        },
      ),
    );
  }
}
