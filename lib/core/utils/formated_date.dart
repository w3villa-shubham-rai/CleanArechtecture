import 'package:intl/intl.dart';

String forMatedDateTime(DateTime dateTime){
  return DateFormat("d MMM, yyyy").format(dateTime);
}