import 'package:app/models/dice_mode.dart';
import 'package:app/views/dice.dart';
import 'package:flutter/material.dart';

class BuilTwoDice extends StatelessWidget {
  const BuilTwoDice(
      {super.key, required this.dices, required this.shouldReloadDice});
  final bool shouldReloadDice;
  final List<DiceMode> dices;

  @override
  Widget build(BuildContext context) {
    double x = 100;
    double y = 165;

    if (shouldReloadDice) {
      dices[0] = DiceMode(value: dices[0].value, point: Offset(x - 55, y));
      dices[1] = DiceMode(value: dices[1].value, point: Offset(x + 55, y));
    }
    else{
      dices[0].point = Offset(x - 55, y);
      dices[1].point = Offset(x + 55, y);
    }

    return Row(children: [BuildDice(dice: dices[0]), BuildDice(dice: dices[1])]);
  }
}
