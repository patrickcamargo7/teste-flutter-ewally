import 'package:intl/intl.dart';
import 'package:teste_ewally/shared/constants/app.dart';

class Helpers {
  static String formatCurrency(double value) {
    final numberFormat = NumberFormat.simpleCurrency(
      locale: appLocale,
    );

    String formattedValue = numberFormat.format(value / 100);

    return formattedValue;
  }

  static String formatDateTime(DateTime value) {
    var format = DateFormat.yMd(appLocale);

    return format.format(value);
  }

  static String formatStringDateTime(String date) {
    var parsedDate = DateTime.parse(date);

    return Helpers.formatDateTime(parsedDate);
  }
}
