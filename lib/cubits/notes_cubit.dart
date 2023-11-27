import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_note/notification_service/notification_sevice.dart';
import '../constants/constants.dart';
import '../models/note_model.dart';

part 'note_states.dart';

class NotesCubit extends Cubit<NotesStates> {
  NotesCubit() : super(NotesInitialStates());

  static NotesCubit get(context) => BlocProvider.of(context);

  Color currentColor = Colors.purpleAccent;

  List<NoteModel> notesList = [];

  void addNote({required NoteModel notesModel}) {
    if (notesModel.title == 'Roaa' && notesModel.subTitle == 'Roaa') {
      emit(RoaaSuccessState());
    } else {
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
    String? notificationDate,
    String? notificationTime,
  }) {
    emit(UpdateNoteLoadingState());
    myBox
        .putAt(
      index,
      NoteModel(title: title, subTitle: subTitle, date: date, color: color
      ,notificationDate: notificationDate, notificationTime: notificationTime),
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

  Color? color;

  void changeAppColor({required Color newColor}) {
    color = newColor;
    emit(ChangeColorSuccessState());
    myColorBox.put('newColor', newColor.value).then((value) {
      emit(ChangeAppColorSuccessState());
    }).catchError((err) {
      emit(ChangeAppColorFailureState(err.toString()));
    });
  }

  void getAppColor() {
    // myColorBox.values.toString()
    try {
      currentColor =
          Color(myColorBox.get('newColor', defaultValue: 0xffeb34de)!);
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

  String customizeDateNowFormat() {
    DateTime today = DateTime.now();
    String date = "${today.hour.toString().padLeft(2, '0')}"
        ":${today.minute.toString().padLeft(2, '0')}"
        "  ${today.year.toString()}"
        "-${today.month.toString().padLeft(2, '0')}"
        "-${today.day.toString().padLeft(2, '0')}";
    return date;
  }

  String formatDate({required DateTime date}) {
    return '${date.year.toString()}'
        '-${date.month.toString().padLeft(2, '0')}'
        '-${date.day.toString().padLeft(2, '0')}';
  }

  bool isBottomSheetOpen = false;
  Icon? fabIcon = const Icon(FontAwesomeIcons.pencil);

  void changeBottomSheetState({
    required bool isBottomSheetOpen,
    required Icon icon,
  }) {
    this.isBottomSheetOpen = isBottomSheetOpen;
    fabIcon = icon;
    emit(BottomSheetChangedSuccessState());
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  Color? noteColor;

  bool isSwitchOn = false;

  void changeSwitchState({required bool value}) {
    isSwitchOn = value;
    emit(ChangeSwitchSuccessState());
  }

  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  DateTime? date;
  TimeOfDay? time;
  String? dateString;

  String? timeString;

  void setDate({required DateTime newDate}) {
    date = newDate;
    dateString = formatDate(date: date!);
    dateController.text = dateString!;
    debugPrint(dateString);
    emit(DateSetSuccessState());
  }

  void setTime({required TimeOfDay newTime, required BuildContext context}) {
    time = newTime;
    timeString = time!.format(context);
    timeController.text = timeString!;
    debugPrint(timeString);
    emit(TimeSetSuccessState());
  }

  void createNotification({
    required DateTime dateTime,
    required TimeOfDay timeOfDay,
    required String title,
    required String body,
}) {
    NotificationServices.createScheduleNotification(
            dateTime, timeOfDay, title, body)
        .then((value) {
          emit(NotificationCreatedSuccessState());
    })
        .catchError((err) {
          emit(NotificationCreatedFailureState(err.toString()));
    });
  }
}
