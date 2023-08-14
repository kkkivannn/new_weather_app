part of 'authorization_cubit.dart';

abstract class AuthorizationState extends Equatable {
  const AuthorizationState();

  @override
  List<Object> get props => [];
}

class AuthorizationInitialState extends AuthorizationState {}

class AuthorizationLoadingState extends AuthorizationState {}

class AuthorizationLoadedState extends AuthorizationState {}

class AuthorizationHaveUserState extends AuthorizationState {}

class AuthorizationNotHaveUserState extends AuthorizationState {}

class AuthorizationErrorState extends AuthorizationState {
  final String message;

  const AuthorizationErrorState({required this.message});
}
