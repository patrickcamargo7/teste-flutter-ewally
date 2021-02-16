import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_ewally/app/screens/auth/cubit/auth_screen_cubit.dart';
import 'package:teste_ewally/app/screens/home/home_screen.dart';
import 'package:teste_ewally/shared/constants/app.dart';
import 'package:teste_ewally/shared/global/global_navigation.dart';
import 'package:teste_ewally/shared/global/global_scaffold.dart';

class AuthScreen extends StatefulWidget {
  static const routeName = '/auth';

  AuthScreen({Key key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appName),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      color: Colors.grey[100],
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: _buildForm(),
    );
  }

  Widget _buildForm() {
    return BlocConsumer<AuthScreenCubit, AuthScreenState>(
      listener: (context, state) {
        if (state is AuthScreenErrorState) {
          GlobalScaffold.instance.showSnackbar(
              SnackBar(content: Text("Usuário ou senha invalídos!")));
        } else if (state is AuthScreenSuccessState) {
          GlobalNavigation.instance.navigatorKey.currentState
              .pushReplacementNamed(HomeScreen.routeName);
        }
      },
      builder: (context, state) {
        final cubit = BlocProvider.of<AuthScreenCubit>(context);

        return Form(
          key: cubit.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: cubit.controllerUsername,
                validator: _requiredFieldValidation,
                focusNode: cubit.focusNodeUsername,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (String value) {
                  cubit.focusNodePassword.requestFocus();
                },
                decoration: const InputDecoration(
                  hintText: 'Usuário',
                ),
              ),
              TextFormField(
                controller: cubit.controllerPassword,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                validator: _requiredFieldValidation,
                focusNode: cubit.focusNodePassword,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (String value) {
                  cubit.onTapSubmitButton();
                },
                decoration: const InputDecoration(
                  hintText: 'Senha',
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: _buildSubmitButton(state),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildSubmitButton(AuthScreenState state) {
    return ElevatedButton(
      onPressed: state is AuthScreenLoadingState
          ? () {}
          : BlocProvider.of<AuthScreenCubit>(context).onTapSubmitButton,
      child: state is AuthScreenLoadingState
          ? SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(),
            )
          : Text(
              'Entrar',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
    );
  }

  String _requiredFieldValidation(value) {
    if (value.isEmpty) {
      return 'Informe um valor válido!';
    }
    return null;
  }
}
