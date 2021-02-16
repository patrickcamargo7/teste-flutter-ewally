import 'package:charts_flutter/flutter.dart' as charts;
import 'package:teste_ewally/shared/models/b2b/statement_model.dart';
import 'package:teste_ewally/shared/util/helpers.dart';
import 'package:supercharged/supercharged.dart';

class StatementGroupedByDateModel {
  double amount;
  String date;

  StatementGroupedByDateModel({this.amount, this.date});

  static List<charts.Series<StatementGroupedByDateModel, String>>
      getChartSeries(List<StatementModel> statement) => [
            new charts.Series<StatementGroupedByDateModel, String>(
              id: 'Statement',
              colorFn: (StatementGroupedByDateModel st, _) => st.amount < 0
                  ? charts.MaterialPalette.red.shadeDefault
                  : charts.MaterialPalette.blue.shadeDefault,
              domainFn: (StatementGroupedByDateModel st, _) =>
                  st.date.substring(0, st.date.length - 5),
              measureFn: (StatementGroupedByDateModel st, _) => st.amount,
              data: StatementGroupedByDateModel.groupByDate(statement),
            )
          ];

  static List<StatementGroupedByDateModel> groupByDate(
    List<StatementModel> statement,
  ) {
    var groupedData = List<StatementGroupedByDateModel>();

    final map = statement.groupBy<dynamic, dynamic>(
      (item) => item.createdAtDate,
      valueTransform: (item) => item,
    );

    map.forEach((key, value) {
      double amountPositive = 0;
      double amountNegative = 0;

      value.forEach((s) {
        if (s.amount > 0)
          amountPositive += (s.amount / 100);
        else
          amountNegative += (s.amount / 100);
      });

      if (amountPositive != 0)
        groupedData.add(
          StatementGroupedByDateModel(
            date: Helpers.formatStringDateTime(key),
            amount: amountPositive,
          ),
        );
      if (amountNegative != 0)
        groupedData.add(
          StatementGroupedByDateModel(
            date: Helpers.formatStringDateTime(key),
            amount: amountNegative,
          ),
        );
    });

    return groupedData;
  }
}
