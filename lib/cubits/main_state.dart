part of 'main_cubit.dart';

@immutable
abstract class MainState {}

class MainInitialState extends MainState {}

class MainLoadingState extends MainState {}
class MainSuccessState extends MainState {}
class MainFailureState extends MainState {
  final String err;

  MainFailureState(this.err);
}


class ChangeAppColorSuccessState extends MainState {}

class NavigateToSuccessState extends MainState {}
class NavigateToSuccessFailure extends MainState {
  final String err;

  NavigateToSuccessFailure(this.err);
}