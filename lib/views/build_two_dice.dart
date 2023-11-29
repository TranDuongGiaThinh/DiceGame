import 'package:app/models/dice_mode.dart';
import 'package:app/views/dice.dart';
import 'package:flutter/material.dart';

class BuilTwoDice extends StatelessWidget {
  const BuilTwoDice(
      {super.key, required this.valueLeftDice, required this.valueRightDice});
  final int valueLeftDice;
  final int valueRightDice;

  @override
  Widget build(BuildContext context) {
    double x = 105;
    double y = 165;
    DiceMode leftDice =
        DiceMode(value: valueLeftDice, point: Offset(x - 55, y));
    DiceMode rightDice =
        DiceMode(value: valueRightDice, point: Offset(x + 55, y));
    return Row(
        children: [buildDice(dice: leftDice), buildDice(dice: rightDice)]);
  }
}
