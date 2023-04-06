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
}
