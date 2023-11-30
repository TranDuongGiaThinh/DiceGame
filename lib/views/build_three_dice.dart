import 'package:app/models/dice_mode.dart';
import 'package:app/views/dice.dart';
import 'package:flutter/material.dart';

class BuildThreeDice extends StatelessWidget {
  const BuildThreeDice({super.key, required this.dices, required this.shouldReloadDice});
  final bool shouldReloadDice;
  final List<DiceMode> dices;

  @override
  Widget build(BuildContext context) {
    double x = 100;
    double y = 195;
    
    if (shouldReloadDice) {
      dices[0] = DiceMode(value: dices[0].value, point: Offset(x - 55, y - 55));
      dices[1] = DiceMode(value: dices[1].value, point: Offset(x + 55, y - 55));
      dices[2] = DiceMode(value: dices[2].value, point: Offset(x, y + 30));
    }
    else{
      dices[0].point = Offset(x - 55, y - 55);
      dices[1].point = Offset(x + 55, y - 55);
      dices[2].point = Offset(x, y + 30);
    }

    return Stack(children: [
      BuildDice(dice: dices[0]),
      BuildDice(dice: dices[1]),
      BuildDice(dice: dices[2])
    ]);
  }
}
