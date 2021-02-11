import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rabbit_clicker/services/save_data.dart';

class Upgrade {
  String name;
  bool active;

  Upgrade(this.name, this.active);

  void setActive() {
    active ? active = false : active = true;
  }
}

class UpgradeModel extends ChangeNotifier {
  List<Upgrade> _list;
  bool _newGame;

  bool get newGame => _newGame;
  List<Upgrade> get list => _list;
  SaveData saveData;

  UpgradeModel() {
    getSaveData();
  }

  void getSaveData() async {
    saveData = new SaveData();
    await saveData.getNewGame();
    _newGame = saveData.newGame;
    setNewGame();
  }

  void setNewGame() {
    if (_newGame) {
      _newGame = false;
      createNewList();
    } else {
      //get saved upgrades
      createNewList();
    }
  }

  void createNewList() {
    _list = [
      Upgrade("+1 to Hay Button ", false),
      Upgrade("Upgrade 2 ", false),
      Upgrade("Upgrade 3 ", false),
      Upgrade("Upgrade 4 ", false),
      Upgrade("Upgrade 5 ", false),
      Upgrade("Upgrade 6 ", false),
      Upgrade("Upgrade 7 ", false),
      Upgrade("Upgrade 8 ", false),
      Upgrade("Upgrade 9 ", false),
      Upgrade("Upgrade 10 ", false),
    ];
  }

  void buyUpgrade(int i) {
    _list[i].setActive();
    notifyListeners();
  }
}
