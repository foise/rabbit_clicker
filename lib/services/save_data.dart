import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class SaveData {
  SharedPreferences prefs;
  double highScore;
  double rabbitCount;
  double hayCount;
  Duration timeElapsed;

  SaveData({this.rabbitCount, this.timeElapsed, this.hayCount});

  Future<void> saveHighScore(double rabbits) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setDouble("highScore", rabbits);
  }

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
      highScore = prefs.getDouble("highScore") ?? 0;
      rabbitCount = prefs.getDouble("rabbitCount") ?? rabbitCount;
      hayCount = prefs.getDouble("hayCount") ?? hayCount;
      timeElapsed = Duration(seconds: prefs.getInt("timeElapsedInSeconds")) ??
          timeElapsed;
    }
  }

  Future<void> resetAll() async {
    prefs = await SharedPreferences.getInstance();
    prefs.setDouble("rabbitCount", 1);
    rabbitCount = 1;
    prefs.setDouble("hayCount", 100);
    hayCount = 100;
    prefs.setInt("timeElapsedInSeconds", 0);
    timeElapsed = Duration(seconds: 0);
    saveAll(1, 100, Duration(seconds: 0));
  }
}
