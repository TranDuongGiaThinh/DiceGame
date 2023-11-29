import 'package:app/models/dice_mode.dart';
import 'package:app/views/dice.dart';
import 'package:flutter/material.dart';

class BuildThreeDice extends StatelessWidget {
  const BuildThreeDice(
      {super.key,
      required this.valueLeftDice,
      required this.valueRightDice,
      required this.valueBottomtDice});
  final int valueLeftDice;
  final int valueRightDice;
  final int valueBottomtDice;

  @override
  Widget build(BuildContext context) {
    double x = 105;
    double y = 185;
    DiceMode leftDice =
        DiceMode(value: valueLeftDice, point: Offset(x - 55, y - 55));
    DiceMode rightDice =
        DiceMode(value: valueRightDice, point: Offset(x + 55, y - 55));
    DiceMode bottomDice =
        DiceMode(value: valueBottomtDice, point: Offset(x, y + 30));
    return Stack(
        children: [buildDice(dice: leftDice), buildDice(dice: rightDice), buildDice(dice: bottomDice)]);
  }
}
