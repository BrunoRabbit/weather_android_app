import 'package:intl/intl.dart';

extension DateExtension on String {
  String dateFormat() {
    final inputFormat = DateFormat("dd/MM/yyyy");
    final inputDate = inputFormat.parse(this);
    final outputFormat = DateFormat("E, dd 'de' MMMM", 'pt_BR');

    return outputFormat.format(inputDate);
  }

  String monthFormat() {
    final inputFormat = DateFormat("dd/MM/yyyy");
    final inputDate = inputFormat.parse(this);
    final outputFormat = DateFormat("MMMM 'de' yyyy", 'pt_BR');

    String month = outputFormat.format(inputDate);
    return month[0].toUpperCase() + month.substring(1);
  }

  String extractDayFromDateString() {
    if (!this[0].contains('0')) {
      return this[0] + this[1];
    } else {
      return this[1];
    }
  }

  String extractDayAndMonth() {
    List<String> parts = split('/');

    return "${parts[0]}/${parts[1]}";
  }
}
