import 'package:intl/intl.dart';

/// 获取某一天的周名
String getWeekNameOfDay() {
  final String weekName;
  final dt = DateTime.now();
  switch (dt.weekday) {
    case 1:
      weekName = 'Monday';
      break;
    case 2:
      weekName = 'Tuesday';
      break;
    case 3:
      weekName = 'Wednesday';
      break;
    case 4:
      weekName = 'Thursday';
      break;
    case 5:
      weekName = 'Friday';
      break;
    case 6:
      weekName = 'Saturday';
      break;
    case 7:
      weekName = 'Sunday';
      break;
    default:
      weekName = 'unknown';
  }
  return weekName;
}

/// 获取格式化的当前时间
/// HH:mm a 12小时制
String getFormattedCurrentTime({String format = 'yyyy-MM-dd HH:mm:ss'}) {
  final dt = DateTime.now();
  String result = DateFormat('HH:mm a').format(dt);
  return result;
}

/// 将时间戳转为格式化字符串
/// convertTimestampToFormatString(timestamp: 1712353823);
/// // 2024-04-06 05:50:23
String convertTimestampToFormatString(
    {required int timestamp,
    String format = 'yyyy-MM-dd HH:mm:ss',
    int timezone = 0}) {
  // 这里是秒级，要转为毫秒计算
  timestamp = timestamp + timezone - DateTime.now().timeZoneOffset.inSeconds;
  if (timestamp.toString().length == 10) {
    timestamp = timestamp * 1000;
  }
  DateTime dt = DateTime.fromMillisecondsSinceEpoch(
    timestamp,
  );

  String formattedString = DateFormat(format).format(dt);
  return formattedString;
}

/// 将字符串格式的日期转为时间戳
/// convertStringToTimestamp(timeString: '2024-04-06 05:50:23');
/// // 1712353823
int convertStringToTimestamp({required String timeString}) {
  int timestamp = DateTime.parse(timeString).millisecondsSinceEpoch;
  return timestamp;
}
