import 'package:intl/intl.dart';
import 'package:sleep_calculator/ResultsPage.dart';

class SleepCalculator {
  int age;
  int sleep;
  int? hours;
  int? min;
  int? period;
  String type;
  SleepCalculator({
    required this.age,
    required this.sleep,
    required this.period,
    required this.hours,
    required this.min,
    required this.type,
  });

  String getRecommendedSleep() {
    String res = "";

    if (age <= 2) {
      res = "11-14 hours of sleep";
    } else if (age <= 5) {
      res = "10-13 hours of sleep";
    } else if (age <= 13) {
      res = "9-11 hours of sleep";
    } else {
      res = "8-10 hours of sleep";
    }

    return res;
  }

  String getRecommendedTime() {
    String userTime = hours.toString() + ":" + min.toString() + type;
    String _peroid = period == 0 ? "AM" : "PM";
    String userSleep = sleep.toString() + ":00" + _peroid;

    DateTime duration = DateFormat("hh:mma").parse(userTime);

    DateTime recomended = period == 0
        ? duration.add(Duration(hours: sleep))
        : duration.subtract(Duration(hours: sleep));

    var res = DateFormat("hh:mma").format(recomended);
    return res.toString();
  }
}
