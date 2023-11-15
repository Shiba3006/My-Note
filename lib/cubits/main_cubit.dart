import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';


import '../constants/constants.dart';
import '../models/note_model.dart';
import '../views/widgets/color_picker.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitialState());

  static MainCubit get(context) => BlocProvider.of(context);

  Color currentColor = Colors.indigoAccent;

  List<NoteModel> noteNotesList = [];

  void addNote(NoteModel notesModel)  {
    emit(AddNoteLoadingState());
        myBox.put(notesModel.title, notesModel).then((value) {
          emit(AddNoteSuccessState());
        }).catchError((err){
          emit(AddNoteFailureState(err.toString()));
          print(err.toString());
        });
  }

  void getNotes(){
    emit(GetNoteLoadingState());
    try {
      noteNotesList = myBox.values.toList();
      emit(GetNoteSuccessState());
      print('=========================${noteNotesList[0].date.toString()}');
    } on Exception catch (err) {
      emit(GetNoteFailureState(err.toString()));
    }
  }

//   void putData ({
//     required String title,
//     required String subTitle,
//     required String date,
//     required int color,
// }){
//     emit(PutDataLoadingState());
//     noteModel = NoteModel(title: title, subTitle: subTitle, date: date, color: color);
//     myBox.put(noteModel!.title, noteModel!).then((value) {
//       emit(PutDataSuccessState());
//       //addNote();
//       print(noteModel.toString());
//     }).catchError((err){
//       emit(PutDataFailureState(err.toString()));
//     });
//   }

  // void getNotesList (){
  //   noteNotesList = myBox.values.toList();
  //   emit(GetNoteSuccessState());
  //   print('========================${noteNotesList!.length}');
  //   print('========================${noteNotesList!.toString()}');
  //   print('========================${noteModel.toString()}');
  // }


  void changeAppColor ({required Color color}){
    currentColor = color ;
    emit(ChangeAppColorSuccessState());
  }

  void pickColor(BuildContext context) { /// TODO move to widget.
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

  void navigateTo (BuildContext context, Widget widget){
    try {
      Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
      emit(NavigateToSuccessState());
    } on Exception catch (err) {
      emit(NavigateToSuccessFailure(err.toString()));
    }
  }
}
