part of 'notes_cubit.dart';

@immutable
abstract class NotesStates {}

class NotesInitialStates extends NotesStates {}

// add note
class AddNoteLoadingState extends NotesStates {}
class AddNoteSuccessState extends NotesStates {}
class AddNoteFailureState extends NotesStates {
  final String err;

  AddNoteFailureState(this.err);
}

// get note
class GetNoteLoadingState extends NotesStates {}
class GetNoteSuccessState extends NotesStates {}
class GetNoteFailureState extends NotesStates {
  final String err;

  GetNoteFailureState(this.err);
}

// update note
class UpdateNoteLoadingState extends NotesStates {}
class UpdateNoteSuccessState extends NotesStates {}
class UpdateNoteFailureState extends NotesStates {
  final String err;

  UpdateNoteFailureState(this.err);
}

// delete note
class DeleteNoteLoadingState extends NotesStates {}
class DeleteNoteSuccessState extends NotesStates {}
class DeleteNoteFailureState extends NotesStates {
  final String err;

  DeleteNoteFailureState(this.err);
}

// change app color and save it in hive box
class ChangeAppColorSuccessState extends NotesStates {}
class ChangeAppColorFailureState extends NotesStates {
  final String err;

  ChangeAppColorFailureState(this.err);
}

// // change note color and save it in hive box
// class ChangeNoteColorSuccessState extends NotesStates {}
// class ChangeNoteColorFailureState extends NotesStates {
//   final String err;
//
//   ChangeNoteColorFailureState(this.err);
// }

// get app saved color from hive box
class GetAppColorSuccessState extends NotesStates {}
class GetAppColorFailureState extends NotesStates {
  final String err;

  GetAppColorFailureState(this.err);
}

// navigator
class NavigateToSuccessState extends NotesStates {}
class NavigateToSuccessFailure extends NotesStates {
  final String err;

  NavigateToSuccessFailure(this.err);
}

// change picker color color
class ChangePickerColorSuccessState extends NotesStates {}
class ChangePickerColorFailureState extends NotesStates {
  final String err;

  ChangePickerColorFailureState(this.err);
}

class RoaaSuccessState extends NotesStates {}