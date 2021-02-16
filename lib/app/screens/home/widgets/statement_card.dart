import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_ewally/app/components/app_card.dart';
import 'package:teste_ewally/app/components/simple_bar_chart.dart';
import 'package:teste_ewally/app/screens/home/cubit/statement_cubit.dart';
import 'package:teste_ewally/app/screens/home/model/statement_grouped_by_date_model.dart';
import 'package:teste_ewally/shared/global/global_scaffold.dart';
import 'package:teste_ewally/shared/models/b2b/statement_model.dart';
import 'package:teste_ewally/shared/util/helpers.dart';

class StatementCard extends StatefulWidget {
  StatementCard({Key key}) : super(key: key);

  @override
  _StatementCardState createState() => _StatementCardState();
}

class _StatementCardState extends State<StatementCard> {
  DateTime initialDate;
  DateTime finalDate;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StatementCubit, StatementState>(
      listener: (context, state) {
        if (state is StatementErrorState) {
          _showSnackbarPeriodError();
        }
      },
      builder: (context, state) {
        return _buildCard(state);
      },
    );
  }

  Widget _buildCard(StatementState state) {
    return AppCard(
      child: Column(
        children: [
          ..._buildStatementHeader(state),
          if (state is StatementSuccessState) _buildStatementList(state),
        ],
      ),
    );
  }

  Widget _buildDateSelectPicker({
    @required String label,
    @required DateTime currentDate,
    @required Function onTap,
  }) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            currentDate != null
                ? Helpers.formatDateTime(currentDate)
                : 'Selecionar',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 12,
              decoration: TextDecoration.underline,
            ),
          ),
        )
      ],
    );
  }

  List<Widget> _buildStatementHeader(StatementState state) {
    return <Widget>[
      Row(children: [
        Expanded(
          flex: 1,
          child: Text(
            "Extrato ",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ]),
      SizedBox(
        height: 10,
      ),
      Row(
        children: [
          Expanded(
            flex: 1,
            child: _buildDateSelectPicker(
              label: "De: ",
              currentDate: initialDate,
              onTap: () => _onTapSelectDate(_setInitialDate, initialDate),
            ),
          ),
          Expanded(
            flex: 1,
            child: _buildDateSelectPicker(
              label: "À: ",
              currentDate: finalDate,
              onTap: () => _onTapSelectDate(_setFinalDate, finalDate),
            ),
          ),
        ],
      ),
      SizedBox(
        height: 10,
      ),
      _buildSearchButton(state),
      if (state is StatementSuccessState) _buildBarChart(state)
    ];
  }

  Widget _buildSearchButton(StatementState state) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: RaisedButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: state is StatementLoadingState
                  ? [
                      SizedBox(
                        height: 25,
                        width: 25,
                        child: CircularProgressIndicator(),
                      ),
                    ]
                  : [
                      Icon(Icons.search),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Pesquisar")
                    ],
            ),
            onPressed:
                state is StatementLoadingState ? () {} : _filterStatement,
          ),
        ),
      ],
    );
  }

  Widget _buildBarChart(StatementSuccessState state) {
    return Container(
      height: MediaQuery.of(context).size.height * .4,
      child: SimpleBarChart(
        StatementGroupedByDateModel.getChartSeries(
            state.baseStatementModel.statement),
      ),
    );
  }

  Widget _buildStatementList(StatementSuccessState state) {
    if (state.baseStatementModel?.statement?.length == 0) {
      return Container(
        child: Center(
          child: Text("Nenhuma operação realizada no período"),
        ),
      );
    }

    return Container(
      margin: EdgeInsets.only(top: 10),
      height: MediaQuery.of(context).size.height * .4,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: state.baseStatementModel?.statement?.length ?? 0,
        itemBuilder: (_, index) => _buildStatementItem(
          state.baseStatementModel.statement[index],
        ),
      ),
    );
  }

  Widget _buildStatementItem(StatementModel statementModel) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey[200]),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            Helpers.formatStringDateTime(
              statementModel.createdAt,
            ),
            style: TextStyle(fontSize: 12),
          ),
          Text(
            statementModel.operationType,
            style: TextStyle(
              fontSize: 10,
            ),
          ),
          Text(
            Helpers.formatCurrency(
              statementModel.amount,
            ),
            style: TextStyle(
              fontSize: 12,
              color: statementModel.amount < 0 ? Colors.red : Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  void _showSnackbarPeriodError() {
    GlobalScaffold.instance.showSnackbar(
        SnackBar(content: Text("Período selecionado não é válido!")));
  }

  void _filterStatement() {
    final cubit = BlocProvider.of<StatementCubit>(context);

    if (initialDate == null || finalDate == null) {
      _showSnackbarPeriodError();
      return;
    }

    cubit.filterStatement(
      initialDate: initialDate,
      finalDate: finalDate,
    );
  }

  void _setInitialDate(DateTime selectedDate) {
    setState(() {
      initialDate = selectedDate;
    });
  }

  void _setFinalDate(DateTime selectedDate) {
    setState(() {
      finalDate = selectedDate;
    });
  }

  Future<void> _onTapSelectDate(
    Function callback, [
    DateTime initialDate,
  ]) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2025),
    );
    if (picked != null) callback(picked);
  }
}
