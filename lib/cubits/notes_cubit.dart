import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants/constants.dart';
import '../models/note_model.dart';

part 'note_states.dart';

class NotesCubit extends Cubit<NotesStates> {
  NotesCubit() : super(NotesInitialStates());

  static NotesCubit get(context) => BlocProvider.of(context);

  Color? currentColor;

  List<NoteModel> notesList = [];

  void addNote({required NoteModel notesModel}) {
    if(notesModel.title == 'Roaa' && notesModel.subTitle == 'Roaa'){
      emit(RoaaSuccessState());
    } else{
      emit(AddNoteLoadingState());
      myBox.put(notesModel.title, notesModel).then((value) {
        emit(AddNoteSuccessState());
        getNotes();
      }).catchError((err) {
        emit(AddNoteFailureState(err.toString()));
      });
    }
  }

  void getNotes() {
    emit(GetNoteLoadingState());
    try {
      notesList = myBox.values.toList();
      emit(GetNoteSuccessState());
    } on Exception catch (err) {
      emit(GetNoteFailureState(err.toString()));
    }
  }

  void updateNote({
    required int index,
    required String title,
    required String subTitle,
    required String date,
    required int color,
  }) {
    emit(UpdateNoteLoadingState());
    myBox
        .putAt(
      index,
      NoteModel(title: title, subTitle: subTitle, date: date, color: color),
    )
        .then((value) {
      emit(AddNoteSuccessState());
      getNotes();
    }).catchError((err) {
      emit(AddNoteFailureState(err.toString()));
      //print(err.toString());
    });
  }

  void deleteNote({required int index}) {
    emit(DeleteNoteLoadingState());
    myBox.deleteAt(index).then((value) {
      emit(DeleteNoteSuccessState());
      getNotes();
    }).catchError((err) {
      emit(DeleteNoteFailureState(err.toString()));
    });
  }

  void changeAppColor({required int newColorValue}) {
    currentColor = Color(newColorValue);
    myColorBox.put('newColor', newColorValue).then((value) {
      emit(ChangeAppColorSuccessState());
    }).catchError((err){
      emit(ChangeAppColorFailureState(err.toString()));
    });
  }

  void getAppColor (){ // myColorBox.values.toString()
    try {
      currentColor = Color(myColorBox.get('newColor', defaultValue: 0xffeb34de)!);
      emit(GetAppColorSuccessState());
    } on Exception catch (err) {
      emit(GetAppColorFailureState(err.toString()));
    }
  }

  void navigateTo(BuildContext context, Widget widget) {
    try {
      Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
      emit(NavigateToSuccessState());
    } on Exception catch (err) {
      emit(NavigateToSuccessFailure(err.toString()));
    }
  }

  String customizeDateFormat() {
    DateTime today = DateTime.now();
    String date =
        "${today.hour.toString().padLeft(2, '0')}"
        ":${today.minute.toString().padLeft(2, '0')}"
        "  ${today.year.toString()}"
        "-${today.month.toString().padLeft(2, '0')}"
        "-${today.day.toString().padLeft(2, '0')}";
    return date;
  }

  bool isBottomSheetOpen = false;
  Icon? fabIcon = const Icon(FontAwesomeIcons.pencil);

  void changeBottomSheetState ({
    required bool isBottomSheetOpen,
    required Icon icon ,
  }){
    this.isBottomSheetOpen = isBottomSheetOpen;
    fabIcon = icon;
    emit(BottomSheetChangedSuccessState());
  }

  Color? color;

  void changeColor ({required Color newColor}){
    color = newColor;
    emit(ChangeColorSuccessState());
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  Color? noteColor;

  bool isSwitchOn = false;

  void changeSwitchState ({required bool value}){
    isSwitchOn = value;
    emit(ChangeSwitchSuccessState());
  }

}
