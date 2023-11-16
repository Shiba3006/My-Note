part of 'main_cubit.dart';

@immutable
abstract class MainState {}

class MainInitialState extends MainState {}

// add note
class AddNoteLoadingState extends MainState {}
class AddNoteSuccessState extends MainState {}
class AddNoteFailureState extends MainState {
  final String err;

  AddNoteFailureState(this.err);
}

// get note
class GetNoteLoadingState extends MainState {}
class GetNoteSuccessState extends MainState {}
class GetNoteFailureState extends MainState {
  final String err;

  GetNoteFailureState(this.err);
}

// update note
class UpdateNoteLoadingState extends MainState {}
class UpdateNoteSuccessState extends MainState {}
class UpdateNoteFailureState extends MainState {
  final String err;

  UpdateNoteFailureState(this.err);
}

class ChangeAppColorSuccessState extends MainState {}

class NavigateToSuccessState extends MainState {}
class NavigateToSuccessFailure extends MainState {
  final String err;

  NavigateToSuccessFailure(this.err);
}