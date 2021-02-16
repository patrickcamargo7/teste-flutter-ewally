import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:teste_ewally/shared/models/auth/auth_data_model.dart';
import 'package:teste_ewally/shared/repositories/contracts/auth_repository_contract.dart';
import 'package:teste_ewally/shared/util/session.dart';

part 'auth_screen_state.dart';

class AuthScreenCubit extends Cubit<AuthScreenState> {
  final AuthRepositoryContract _repository;

  final formKey = GlobalKey<FormState>();
  final controllerUsername = TextEditingController();
  final controllerPassword = TextEditingController();
  final focusNodeUsername = FocusNode();
  final focusNodePassword = FocusNode();

  AuthScreenCubit(this._repository) : super(AuthScreenInitial());

  void onTapSubmitButton() {
    if (!formKey.currentState.validate()) return;

    var authData = AuthDataModel(
      username: controllerUsername.text,
      password: controllerPassword.text,
    );

    submit(authData);
  }

  Future<void> submit(AuthDataModel authData) async {
    try {
      emit(AuthScreenLoadingState());

      final authorization = await this._repository.authenticate(authData);
      Session.setAuthAuthorization(authorization);

      emit(AuthScreenSuccessState());
    } catch (e) {
      emit(AuthScreenErrorState());
    }
  }
}
