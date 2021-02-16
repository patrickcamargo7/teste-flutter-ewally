import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_ewally/app/screens/home/cubit/balance_cubit.dart';
import 'package:teste_ewally/app/screens/home/cubit/home_screen_cubit.dart';
import 'package:teste_ewally/app/screens/home/widgets/balance_card.dart';
import 'package:teste_ewally/app/screens/home/widgets/statement_card.dart';
import 'package:teste_ewally/shared/constants/app.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<BalanceCubit>(context).fetchBalance();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeScreenCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(appName),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: cubit.logout,
          )
        ],
      ),
      body: Container(
        color: Colors.grey[100],
        padding: EdgeInsets.only(left: 16, right: 16, top: 16),
        width: MediaQuery.of(context).size.width,
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          BalanceCard(),
          SizedBox(
            height: 15,
          ),
          StatementCard()
        ],
      ),
    );
  }
}
