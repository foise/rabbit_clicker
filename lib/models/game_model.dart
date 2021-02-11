import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rabbit_clicker/services/save_data.dart';

class RabbitClicker extends ChangeNotifier {
  SaveData saveData;
  double _highScore;
  double _rabbitCount = 1.0;
  double _hayCount = 100.0;

  double _hayCosumptionPerSecond = 1.0;

  bool _lose = false;
  bool _tap = false;
  bool _pause = false;
  double _tapdy;
  double _tapdx;

  Stopwatch _watch;
  Timer _timer;
  Duration _timeElapsed = Duration.zero;

  bool _newGame;

  double get highScore => _highScore;
  double get rabbitCount => _rabbitCount;
  double get hayCount => _hayCount;

  double get hayConsumptionPerSecond => _hayCosumptionPerSecond;

  bool get lose => _lose;
  bool get tap => _tap;
  bool get pause => _pause;
  double get tapdy => _tapdy;
  double get tapdx => _tapdx;

  Stopwatch get watch => _watch;
  Timer get timer => _timer;
  Duration get timeElapsed => _timeElapsed;

  bool get newGame => _newGame;

  RabbitClicker() {
    _watch = Stopwatch();
    getSaveData();
  }

  void setPause() {
    _pause ? _pause = false : _pause = true;
    notifyListeners();
  }

  void setLose() {
    _lose ? _lose = false : _lose = true;
    notifyListeners();
  }

  void handleLose() {
    saveData.resetAll();
    _lose = false;
    _pause = false;
    getSaveData();
    notifyListeners();
  }

  void getSaveData() async {
    saveData = new SaveData();
    await saveData.readAll();
    _highScore = saveData.highScore;
    _rabbitCount = saveData.rabbitCount;
    _hayCount = saveData.hayCount;
    _timeElapsed = saveData.timeElapsed;
    _newGame = saveData.newGame;
    notifyListeners();
  }

  void saveAll() async {
    await saveData.saveAll(_rabbitCount, _hayCount, _timeElapsed);
  }

  void onTimerTick(Timer timer) {
    _timeElapsed += Duration(seconds: 1);
    eatHay();
    saveAll();
    saveData.saveHighScore(_rabbitCount);
    checkLose();
    notifyListeners();
  }

  void startTimer() {
    _watch.start();
    _timer = Timer.periodic(Duration(seconds: 1), onTimerTick);
    notifyListeners();
  }

  void stopTimer() {
    _timer?.cancel();
    _watch.stop();
    saveAll();
    print("Timer stoped");
    notifyListeners();
  }

  void checkLose() {
    if (hayCount <= 0) {
      stopTimer();
      setLose();
      setPause();
      saveAll();
      notifyListeners();
    }
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

  //debug
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
