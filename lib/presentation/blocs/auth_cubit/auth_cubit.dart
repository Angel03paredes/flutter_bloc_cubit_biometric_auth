import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState(isAuth: false));

  void changeAuth(bool value) {
    emit(state.copyWith(isAuth: value));
  }

  void reset() {
    emit(state.copyWith(isAuth: false));
  }
}
