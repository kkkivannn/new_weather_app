import 'package:intl/intl.dart';

class Constants {
  static String baseUrl = 'https://api.openweathermap.org';
  static String apiKey = "6440e053d444941f9e4e8c826abd6190";
  static final DateFormat timeFormat = DateFormat('HH:mm');
  static List<String> months = [
    '',
    'Января',
    'Февраля',
    'Марта',
    'Апреля',
    'Марта',
    'Июня',
    'Июля',
    'Августа',
    'Сентября',
    'Октября',
    'Ноября',
    'Декабря',
  ];
}
