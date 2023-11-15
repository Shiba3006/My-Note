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

// put data
class PutDataLoadingState extends MainState {}
class PutDataSuccessState extends MainState {}
class PutDataFailureState extends MainState {
  final String err;

  PutDataFailureState(this.err);
}

class ChangeAppColorSuccessState extends MainState {}

class NavigateToSuccessState extends MainState {}
class NavigateToSuccessFailure extends MainState {
  final String err;

  NavigateToSuccessFailure(this.err);
}