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

class ChangeAppColorSuccessState extends NotesStates {}
class ChangeAppColorFailureState extends NotesStates {
  final String err;

  ChangeAppColorFailureState(this.err);
}

class GetAppColorSuccessState extends NotesStates {}
class GetAppColorFailureState extends NotesStates {
  final String err;

  GetAppColorFailureState(this.err);
}

class NavigateToSuccessState extends NotesStates {}
class NavigateToSuccessFailure extends NotesStates {
  final String err;

  NavigateToSuccessFailure(this.err);
}