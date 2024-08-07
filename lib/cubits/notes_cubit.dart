import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_note/notification_service/local_notfication_service.dart';
import '../constants/constants.dart';
import '../models/note_model.dart';

part 'note_states.dart';

class NotesCubit extends Cubit<NotesStates> {
  NotesCubit() : super(NotesInitialStates());

  static NotesCubit get(context) => BlocProvider.of(context);

  Color currentColor = Colors.purpleAccent;

  List<NoteModel> notesList = [];

  bool? isSetting;

  void addNote({required NoteModel notesModel}) {
    if (notesModel.title == 'Roaa' && notesModel.subTitle == 'Roaa') {
      emit(RoaaSuccessState());
    } else {
      emit(AddNoteLoadingState());
      myBox.put(notesModel.title, notesModel).then((value) {
        emit(AddNoteSuccessState());
        getNotes();
        emit(GetNotesAndBSClosedSuccessState());
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
    required int color,
    required int id,
    String? notificationDate,
    String? notificationTime,
  }) {
    emit(UpdateNoteLoadingState());

    myBox
        .putAt(
      index,
      NoteModel(
        id: id,
        title: title,
        subTitle: subTitle,
        date: DateTime.now().toString(),
        color: color,
        notificationDate: notificationDate,
        notificationTime: notificationTime,
      ),
    )
        .then((value) {
      emit(AddNoteSuccessState());
      getNotes();
    }).catchError((err) {
      emit(AddNoteFailureState(err.toString()));
      //print(err.toString());
    });
  }

  void deleteNote({required int index, required int id}) {
    emit(DeleteNoteLoadingState());
    myBox.deleteAt(index).then((value) {
      emit(DeleteNoteSuccessState());
      getNotes();
      _deleteNotification(id: id);
    }).catchError((err) {
      emit(DeleteNoteFailureState(err.toString()));
    });
  }

  void changeAppColor({required Color newColor}) {
    if (isSetting!) {
      currentColor = newColor;
      emit(ChangeColorSuccessState());
      myColorBox.put('newColor', newColor.value).then((value) {
        emit(ChangeAppColorSuccessState());
      }).catchError((err) {
        emit(ChangeAppColorFailureState(err.toString()));
      });
    } else {
      noteColor = newColor;
      emit(ChangeColorSuccessState());
    }
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
    dateController.text = '';
    timeController.text = '';
    isReminderSwitchOn = false;
    emit(BottomSheetChangedSuccessState());
  }

  final scaffoldKey = GlobalKey<ScaffoldState>(); // To activate bottomSheet.

  final GlobalKey<FormState> bottomSheetFormKey =
      GlobalKey(); // To validate in bottomSheet.

  AutovalidateMode autoValidateMode = AutovalidateMode.always;
  String? title, subTitle;
  Color? noteColor;

  bool isReminderSwitchOn = false;
  bool isRepeaterSwitchOn = false;

  void changeReminderSwitchState({required bool value}) {
    isReminderSwitchOn = value;
    emit(ChangeReminderSwitchSuccessState());
  }

  void changeRepeaterSwitchState({required bool value}) {
    isRepeaterSwitchOn = value;
    emit(ChangeRepeaterSwitchSuccessState());
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
    emit(DateSetSuccessState());
  }

  void setTime({required TimeOfDay newTime, required BuildContext context}) {
    time = newTime;
    timeString = time!.format(context);
    timeController.text = timeString!;
    debugPrint(timeString);
    emit(TimeSetSuccessState());
  }

  void createScheduleNotification({
    required DateTime dateTime,
    required TimeOfDay timeOfDay,
    required String title,
    required String body,
  }) {
    if (date != null && time != null) {
      LocalNotificationService.showScheduleNotification(
        title: title,
        body: body,
        dateTime: dateTime,
        timeOfDay: timeOfDay,
      ).then((value) {
        emit(ScheduleNotificationCreatedSuccessState());
      }).catchError((err) {
        emit(ScheduleNotificationCreatedFailureState(err.toString()));
      });
    }
  }

  void _deleteNotification({
    required int id,
  }) {
    LocalNotificationService.cancelNotification(id).then((value) {
      emit(NotificationsDeletedSuccessState());
    }).catchError((err) {
      emit(NotificationDeletedFailureState(err.toString()));
    });
  }

  static int _createUniqueId() {
    // for Notification UniqueId
    return DateTime.now().millisecondsSinceEpoch.remainder(10000);
  }

  TimeOfDay parseTimeOfDay(String time) {
    final List<String> parts = time.split(' ');
    if (parts.length != 2) {
      throw const FormatException('Invalid time format. Use hh:mm a');
    }

    final List<String> timeParts = parts[0].split(':');
    if (timeParts.length != 2) {
      throw const FormatException('Invalid time format. Use hh:mm a');
    }

    final int hour = int.parse(timeParts[0]);
    final int minute = int.parse(timeParts[1]);
    final String periodString = parts[1].toUpperCase(); // Get AM/PM

    if (hour < 1 ||
        hour > 12 ||
        minute < 0 ||
        minute > 59 ||
        (periodString != 'AM' && periodString != 'PM')) {
      throw const FormatException(
          'Invalid time values. Hour should be between 1 and 12, minute between 0 and 59, and period should be AM or PM.');
    }

    // Corrected part: Use the correct parameter name in the TimeOfDay constructor
    return TimeOfDay(hour: hour, minute: minute);
  }
}
