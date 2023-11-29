import 'package:app/models/dice_mode.dart';
import 'package:app/views/dice.dart';
import 'package:flutter/material.dart';

class BuildOneDice extends StatelessWidget {
  const BuildOneDice({super.key, required this.value});
  final int value;

  @override
  Widget build(BuildContext context) {
    double x = 100;
    double y = 170;
    DiceMode dice;

    dice = DiceMode(value: value, point: Offset(x, y));
    return BuildDice(dice: dice);
  }
}
