import 'dart:math';

import 'package:app/models/dice_mode.dart';
import 'package:flutter/material.dart';

class StateIndexScreen with ChangeNotifier {
  bool modeHise = true;
  bool isHide = false;
  bool isSetting = false;
  bool shouldReload = false;
  int count = 3;

  double? widthBowl;
  double? heightBowl;

  final List<DiceMode> dices = [
    DiceMode(value: 1, point: const Offset(100 - 55, 180 - 50)),
    DiceMode(value: 1, point: const Offset(100 + 55, 180 - 50)),
    DiceMode(value: 1, point: const Offset(100, 180 + 25))
  ];
  int score = 3;

  void reload(){
    notifyListeners();
  }

  void updateHideStatus(bool newValue) {
    if (!newValue) {
      shouldReload = false;
    }
    isHide = newValue;
    notifyListeners();
  }

  void setSizeBowl(double w, double h) {
    widthBowl = w;
    heightBowl = h;
  }

  void setSetting(bool newValue) {
    isSetting = newValue;
    notifyListeners();
  }

  void updateMode(int newCount, bool newMode, bool newIsSetting, bool reload) {
    count = newCount;
    modeHise = newMode;
    isSetting = newIsSetting;
    shouldReload = reload;
    notifyListeners();
  }

  void rollDices() {
    score = 0;
    for (int i = 0; i < count; i++) {
      dices[i].value = Random().nextInt(6) + 1;
      score += dices[i].value;
    }
    shouldReload = true;
    notifyListeners();
  }
}
