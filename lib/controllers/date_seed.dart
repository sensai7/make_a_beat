import 'package:intl/intl.dart';

class DateSeed {
  String formattedDate = "";
  int dateSeed = 0;

  DateSeed() {
    var now = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd');
    formattedDate = formatter.format(now);
    dateSeed = int.tryParse(formattedDate.replaceAll(RegExp('-'), ''))!;
  }

  int randomSeed() {
    var now = DateTime.now();
    var formatter = DateFormat('dd-mm-ss');
    formattedDate = formatter.format(now);
    return int.tryParse(formattedDate.replaceAll(RegExp('-'), ''))!;
  }
}
