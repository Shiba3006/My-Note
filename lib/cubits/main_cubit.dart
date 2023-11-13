

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import '../constants/constants.dart';
import '../models/note_model.dart';
import '../views/widgets/color_picker.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitialState());

  Color primaryColor = Colors.green;

  static MainCubit get(context) => BlocProvider.of(context);

  void addNote(NoteModel noteModel) {
    emit(MainLoadingState());
    Hive.box<NoteModel>(notesBox)
        .add(noteModel)
        .then((value) {
          emit(MainSuccessState());
    })
        .catchError((err) {
      emit(MainFailureState(err.toString()));
    });
  }

  void changeAppColor ({required Color color}){
    primaryColor = color ;
    emit(ChangeAppColorSuccessState());
  }

  Color getPrimaryColor (){
    emit(GetAppColorSuccessState());
    return primaryColor;
  }

  void pickColor(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(' Pick your color: '),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const BuildColorPicker(),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Select',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
