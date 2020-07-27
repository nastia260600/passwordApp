import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'password_event.dart';

part 'password_state.dart';

class PasswordBloc extends Cubit<bool> {
  //PasswordBloc(PasswordState initialState) : super(initialState);

  PasswordBloc() : super(false);

  void toggleShowPassword() => emit(!state);
}
