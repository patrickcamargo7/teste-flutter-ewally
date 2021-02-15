import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:teste_ewally/app/screens/auth/auth_screen.dart';
import 'package:teste_ewally/app/screens/auth/cubit/auth_screen_cubit.dart';
import 'package:teste_ewally/app/screens/home/cubit/home_screen_cubit.dart';
import 'package:teste_ewally/app/screens/home/home_screen.dart';
import 'package:teste_ewally/shared/global/global_scaffold.dart';
import 'package:teste_ewally/shared/repositories/contracts/account_repository_contract.dart';
import 'package:teste_ewally/shared/repositories/contracts/auth_repository_contract.dart';
import 'package:teste_ewally/shared/repositories/contracts/b2b_repository_contract.dart';

class AppWidget extends StatefulWidget {
  AppWidget({Key key}) : super(key: key);

  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App',
      theme: _buildThemeData(),
      builder: (context, child) {
        return Scaffold(
          key: GlobalScaffold.instance.scaffoldKey,
          body: child,
        );
      },
      initialRoute: AuthScreen.routeName,
      routes: {
        //Auth screen
        AuthScreen.routeName: (context) => BlocProvider<AuthScreenCubit>(
              create: (BuildContext context) => AuthScreenCubit(
                Provider.of<AuthRepositoryContract>(context, listen: false),
              ),
              child: AuthScreen(),
            ),
        //Auth screen
        HomeScreen.routeName: (context) => BlocProvider<HomeScreenCubit>(
              create: (BuildContext context) => HomeScreenCubit(
                Provider.of<B2bRepositoryContract>(context, listen: false),
                Provider.of<AccountRepositoryContract>(context, listen: false),
              ),
              child: AuthScreen(),
            ),
      },
    );
  }

  ThemeData _buildThemeData() {
    return ThemeData(
      primarySwatch: Colors.lightBlue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
        textTheme: TextTheme(
          // ignore: deprecated_member_use
          title: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
