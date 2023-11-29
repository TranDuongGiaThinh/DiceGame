import 'package:app/models/dice_mode.dart';
import 'package:app/views/quadrilateral.dart';
import 'package:flutter/material.dart';

class BuildDice extends StatelessWidget {
  const BuildDice({super.key, required this.dice});
  final DiceMode dice;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Quadrilateral(quadrilateral: dice.qMain!, isLeft: null),
      Quadrilateral(quadrilateral: dice.qLeft!, isLeft: true),
      Quadrilateral(quadrilateral: dice.qRight!, isLeft: false),
    ]);
  }
}
