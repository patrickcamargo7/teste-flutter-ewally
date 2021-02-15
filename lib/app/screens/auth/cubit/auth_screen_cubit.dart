import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:teste_ewally/shared/repositories/contracts/auth_repository_contract.dart';

part 'auth_screen_state.dart';

class AuthScreenCubit extends Cubit<AuthScreenState> {
  final AuthRepositoryContract _repository;

  AuthScreenCubit(this._repository) : super(AuthScreenInitial());
}
