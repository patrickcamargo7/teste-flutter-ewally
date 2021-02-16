import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_ewally/app/components/app_card.dart';
import 'package:teste_ewally/app/screens/home/cubit/balance_cubit.dart';
import 'package:teste_ewally/shared/util/helpers.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BalanceCubit, BalanceState>(
      listener: (context, state) {},
      builder: (context, state) {
        return _buildCard(state);
      },
    );
  }

  Widget _buildCard(BalanceState state) {
    return AppCard(
      child: Column(
        children: [
          if (state is BalanceSuccessState) ..._buildBalance(state),
          if (state is BalanceLoadingState) ..._buildLoading(),
          if (state is BalanceErrorState) ..._buildError(),
        ],
      ),
    );
  }

  List<Widget> _buildLoading() {
    return <Widget>[
      SizedBox(height: 25, width: 25, child: CircularProgressIndicator())
    ];
  }

  List<Widget> _buildError() {
    return <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Não possível carregar o saldo atual."),
        ],
      )
    ];
  }

  List<Widget> _buildBalance(BalanceSuccessState state) {
    return <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            Helpers.formatCurrency(state.balanceModel.balance),
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      SizedBox(
        height: 5,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Saldo Atual",
            style: TextStyle(
              fontSize: 10,
            ),
          ),
        ],
      ),
    ];
  }
}
