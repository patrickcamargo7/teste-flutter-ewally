import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_ewally/app/app_widget.dart';
import 'package:teste_ewally/shared/global/dio_instance.dart';
import 'package:teste_ewally/shared/repositories/account_repository.dart';
import 'package:teste_ewally/shared/repositories/auth_repository.dart';
import 'package:teste_ewally/shared/repositories/b2b_repository.dart';
import 'package:teste_ewally/shared/repositories/contracts/account_repository_contract.dart';
import 'package:teste_ewally/shared/repositories/contracts/auth_repository_contract.dart';
import 'package:teste_ewally/shared/repositories/contracts/b2b_repository_contract.dart';

class AppModule extends StatelessWidget {
  final bool isAuthenticated;

  const AppModule({Key key, this.isAuthenticated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Dio>(create: (_) => DioInstance.newInstance()),
        ProxyProvider<Dio, AuthRepositoryContract>(
          update: (_, Dio dio, AuthRepositoryContract authRepositoryContract) =>
              AuthRepository(dio),
        ),
        ProxyProvider<Dio, AccountRepositoryContract>(
          update:
              (_, Dio dio, AccountRepositoryContract authRepositoryContract) =>
                  AccountRepository(dio),
        ),
        ProxyProvider<Dio, B2bRepositoryContract>(
          update: (_, Dio dio, B2bRepositoryContract b2bRepositoryContract) =>
              B2bRepository(dio),
        ),
      ],
      child: AppWidget(isAuthenticated: isAuthenticated),
    );
  }
}
