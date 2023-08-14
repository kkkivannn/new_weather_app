part of 'registration_cubit.dart';

class RegistrationState extends Equatable {
  const RegistrationState();

  @override
  List<Object> get props => [];
}

class RegistrationInitialState extends RegistrationState {}

class RegistrationLoadingState extends RegistrationState {}

class RegistrationLoadedState extends RegistrationState {}

class RegistrationErrorState extends RegistrationState {
  final String message;

  const RegistrationErrorState({required this.message});
}
