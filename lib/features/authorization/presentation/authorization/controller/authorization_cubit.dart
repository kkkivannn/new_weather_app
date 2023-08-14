import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_weather_app/features/authorization/firebase/authorization.dart';

part 'authorization_state.dart';

class AuthorizationCubit extends Cubit<AuthorizationState> {
  final AuthorizationFirebase authorizationFirebase;
  AuthorizationCubit({required this.authorizationFirebase})
      : super(AuthorizationInitialState());
  Future<void> haveUser() async {
    try {
      emit(AuthorizationLoadingState());
      if (await authorizationFirebase.getUser() != null) {
        emit(AuthorizationHaveUserState());
      } else {
        emit(AuthorizationNotHaveUserState());
      }
    } catch (e) {
      emit(const AuthorizationErrorState(message: 'Нужна регистрация'));
    }
  }

  Future<void> signIn({required String email, required String password}) async {
    try {
      emit(AuthorizationLoadingState());
      await authorizationFirebase.signIn(email: email, password: password);
      emit(AuthorizationLoadedState());
    } on FirebaseAuthException catch (e) {
      String error = 'Что-то пошлло не так!';
      if (e.code == 'channel-error') {
        error = 'Вы ввели что-то не так!';
      } else if (e.code == 'invalid-email') {
        error = 'Вы ввели не так Email!';
      } else if (e.code == 'user-not-found') {
        error = 'Такого пользователя нет!';
      } else if (e.code == 'wrong-password') {
        error = 'Вы ввели не тот пароль!';
      }
      emit(AuthorizationErrorState(message: error));
    }
  }
}
