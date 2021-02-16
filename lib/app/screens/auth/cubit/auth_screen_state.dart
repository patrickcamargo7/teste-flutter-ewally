part of 'auth_screen_cubit.dart';

abstract class AuthScreenState extends Equatable {
  const AuthScreenState();

  @override
  List<Object> get props => [];
}

class AuthScreenInitial extends AuthScreenState {}

class AuthScreenLoadingState extends AuthScreenState {}

class AuthScreenSuccessState extends AuthScreenState {}

class AuthScreenErrorState extends AuthScreenState {}
