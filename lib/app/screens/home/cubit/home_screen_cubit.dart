import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:teste_ewally/app/screens/auth/auth_screen.dart';
import 'package:teste_ewally/shared/global/global_navigation.dart';
import 'package:teste_ewally/shared/global/global_scaffold.dart';
import 'package:teste_ewally/shared/util/session.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(HomeScreenInitial());

  Future<void> logout() async {
    Session.logout().then((value) {
      GlobalNavigation.instance.navigatorKey.currentState
          .pushReplacementNamed(AuthScreen.routeName);
    }).catchError((onError) {
      GlobalScaffold.instance
          .showSnackbar(SnackBar(content: Text("Erro ao realizar o logout")));
    });
  }
}
