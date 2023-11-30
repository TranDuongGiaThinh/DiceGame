import 'package:app/models/dice_mode.dart';
import 'package:app/views/dice.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BuildOneDice extends StatelessWidget {
  const BuildOneDice({super.key, required this.dices, required this.shouldReloadDice});
  final bool shouldReloadDice;
  final List<DiceMode> dices;

  @override
  Widget build(BuildContext context) {
    double x = 100;
    double y = 170;

    if (shouldReloadDice) {
      dices[0] = DiceMode(value: dices[0].value, point: Offset(x, y));
    }
    else{
      dices[0].point = Offset(x, y);
    }

    return BuildDice(dice: dices[0]);
  }
}
