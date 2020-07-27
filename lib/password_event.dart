part of 'password_bloc.dart';

@immutable
class PasswordEvent {}

class PasswordEventSubmit extends PasswordEvent {
  final String password;

  PasswordEventSubmit(this.password);
}
