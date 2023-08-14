import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_weather_app/features/authorization/firebase/authorization.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  final AuthorizationFirebase authorizationFirebase;
  RegistrationCubit({required this.authorizationFirebase})
      : super(RegistrationInitialState());
  Future<void> sinUp({required String email, required String password}) async {
    try {
      emit(RegistrationLoadingState());
      await authorizationFirebase.signUp(email: email, password: password);
      emit(RegistrationLoadedState());
    } on FirebaseException catch (e) {
      String error = 'Что-то пошлло не так!';
      if (e.code == 'channel-error') {
        error = 'Вы ввели что-то не так!';
      } else if (e.code == 'invalid-email') {
        error = 'Вы ввели не так Email!';
      } else if (e.code == 'user-not-found') {
        error = 'Такого пользователя нет!';
      } else if (e.code == 'weak-password') {
        error = 'Пароль должен быть не меньше 6 символов!';
      }
      emit(RegistrationErrorState(message: error));
    }
  }
}
