part of 'password_bloc.dart';

@immutable
class PasswordState {
  final bool isOpen;
  final bool isClose;

  PasswordState({
    this.isOpen: false,
    this.isClose: false,
  });
}

class PasswordInitial extends PasswordState {}