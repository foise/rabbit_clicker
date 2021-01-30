import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rabbit_clicker/services/save_data.dart';

class RabbitClicker extends ChangeNotifier {
  SaveData saveData;
  double _rabbitCount = 1.0;
  double _hayCount = 100.0;

  double _hayCosumptionPerSecond = 1.0;

  bool _tap = false;
  bool _pause = false;
  double _tapdy;
  double _tapdx;

  Stopwatch _watch;
  Timer _timer;
  Duration _timeElapsed = Duration.zero;

  double get rabbitCount => _rabbitCount;
  double get hayCount => _hayCount;

  double get hayConsumptionPerSecond => _hayCosumptionPerSecond;

  bool get tap => _tap;
  bool get pause => _pause;
  double get tapdy => _tapdy;
  double get tapdx => _tapdx;

  Stopwatch get watch => _watch;
  Timer get timer => _timer;
  Duration get timeElapsed => _timeElapsed;

  RabbitClicker() {
    _watch = Stopwatch();
    getSaveData();
  }

  void setPause() {
    if (_pause)
      _pause = false;
    else
      _pause = true;
  }

  void getSaveData() async {
    saveData = new SaveData();
    await saveData.readAll();
    _rabbitCount = saveData.rabbitCount;
    _hayCount = saveData.hayCount;
    _timeElapsed = saveData.timeElapsed;
    notifyListeners();
  }

  void saveAll() async {
    await saveData.saveAll(_rabbitCount, _hayCount, _timeElapsed);
  }

  void onTimerTick(Timer timer) {
    _timeElapsed += Duration(seconds: 1);
    eatHay();
    saveAll();
    notifyListeners();
  }

  void startTimer() {
    _watch.start();
    _timer = Timer.periodic(Duration(seconds: 1), onTimerTick);
    notifyListeners();
  }

  void stopWatch() {
    _watch.stop();
  }

  void stopTimer() {
    _timer?.cancel();
    stopWatch();
    saveAll();
    print("Timer stoped");
    notifyListeners();
  }

  void resetTimer() {
    stopTimer();
    _watch.reset();
    _timeElapsed = Duration.zero;

    notifyListeners();
  }

  void addRabbit(double count) {
    _rabbitCount += count;
    notifyListeners();
  }

  void addHay(double count) {
    _hayCount += count;
    notifyListeners();
  }

  //debug only
  void eatALLHay() {
    _hayCount = 0;
    notifyListeners();
  }

  void eatHay() {
    _hayCount -= _hayCosumptionPerSecond;
    notifyListeners();
  }

  void press() {
    _tap = true;
    notifyListeners();
  }

  void unpress() {
    _tap = false;
    notifyListeners();
  }

  void updateTapDetails(TapDownDetails details) {
    _tapdx = details.globalPosition.dx;
    _tapdy = details.globalPosition.dy;
  }
}
