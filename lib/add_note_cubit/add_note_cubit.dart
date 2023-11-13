import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';

import '../constans/constans.dart';
import '../models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  void addNote(NoteModel noteModel) {

    emit(AddNoteLoading());
    Hive.box<NoteModel>(notesBox)
        .add(noteModel)
        .then((value) {
          emit(AddNoteSuccess());
    })
        .catchError((err) {
      emit(AddNoteFailure(err.toString()));
    });
  }
}
