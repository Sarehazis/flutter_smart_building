import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthStateInitial()) {
    on<AuthEventLogin>((event, emit) async {
      emit(AuthStateLoading());

      bool isSuccess = _validateLogin(event.email, event.password);

      await Future.delayed(const Duration(seconds: 2));

      if (isSuccess) {
        emit(AuthStateLoaded());
      } else {
        emit(AuthStateError(message: 'Data yang dimasukkan salah'));
      }
    });
  }

  bool _validateLogin(String email, String password) {
    if (email == 'sarehazis@example.com' && password == 'sareh123') {
      return true;
    } else {
      return false;
    }
  }
}
