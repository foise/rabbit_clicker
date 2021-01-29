import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class SaveData {
  SharedPreferences prefs;
  double rabbitCount;
  double hayCount;
  Duration timeElapsed;

  SaveData({this.rabbitCount, this.timeElapsed, this.hayCount});

  Future<void> saveAll(double rabbits, double hay, Duration time) async {
    prefs = await SharedPreferences.getInstance();
    rabbitCount = rabbits;
    hayCount = hay;
    timeElapsed = time;
    prefs.setDouble("rabbitCount", rabbitCount);
    prefs.setDouble("hayCount", hayCount);
    prefs.setInt("timeElapsedInSeconds", time.inSeconds);
  }

  Future<void> readAll() async {
    prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey("rabbitCount")) {
      rabbitCount = 1.0;
      hayCount = 100;
      timeElapsed = Duration.zero;
      prefs.setDouble("rabbitCount", rabbitCount);
      prefs.setDouble("hayCount", hayCount);
      prefs.setInt("timeElapsedInSeconds", timeElapsed.inSeconds);
    } else {
      rabbitCount = prefs.getDouble("rabbitCount") ?? rabbitCount;
      hayCount = prefs.getDouble("hayCount") ?? hayCount;
      timeElapsed = Duration(seconds: prefs.getInt("timeElapsedInSeconds")) ??
          timeElapsed;
    }
  }
}
