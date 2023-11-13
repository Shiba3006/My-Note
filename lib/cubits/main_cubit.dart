import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import '../constants/constants.dart';
import '../models/note_model.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitialState());

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
}
