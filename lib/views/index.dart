import 'dart:math';

import 'package:app/views/build_one_dice.dart';
import 'package:app/views/build_three_dice.dart';
import 'package:app/views/build_two_dice.dart';
import 'package:app/views/plate.dart';
import 'package:flutter/material.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({super.key});

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  int count = 3;
  List<int> values = [5, 1, 1];
  int score = 0;

  rollDices() {
    score = 0;
    for (int i = 0; i < count; i++) {
      values[i] = Random().nextInt(6) + 1;
      score += values[i];
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Dice Game"),
          actions: const [Icon(Icons.settings)],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Điểm: $score",
              style: const TextStyle(
                  color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Center(
              child: Container(
                width: 200,
                height: 300,
                child: Stack(children: [Plate(), buildListItem()]),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  rollDices();
                },
                child: const Text("Lắc"))
          ],
        ));
  }

  Widget buildListItem() {
    if (count == 1) {
      return BuildOneDice(
        value: values[0],
      );
    } else if (count == 2) {
      return BuilTwoDice(valueLeftDice: values[0], valueRightDice: values[1]);
    } else {
      return BuildThreeDice(
          valueLeftDice: values[0],
          valueRightDice: values[1],
          valueBottomtDice: values[2]);
    }
  }
}
