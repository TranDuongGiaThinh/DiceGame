import 'dart:math';

import 'package:app/views/bowl.dart';
import 'package:app/views/build_setting_box.dart';
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
  bool mode = false;
  int count = 3;
  List<int> values = [1, 1, 1];
  int score = 0;

  bool isSetting = false;
  bool isHide = true;

  rollDices() {
    score = 0;
    for (int i = 0; i < count; i++) {
      values[i] = Random().nextInt(6) + 1;
      score += values[i];
    }
    setState(() {});
  }

  @override
  initState() {
    super.initState();
    rollDices();
  }

  updateMode(int newCount, bool newMode) {
    count = newCount;
    mode = newMode;
    isSetting = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Dice Game"),
          actions: [
            IconButton(
                onPressed: () {
                  if (!isSetting) {
                    setState(() {
                      isSetting = true;
                    });
                  }
                },
                icon: const Icon(Icons.settings))
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: isSetting
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.center,
              children: [
                if (isSetting) const SizedBox(),
                Text(
                  (!mode && isHide) ? "Điểm: ?" : "Điểm: $score",
                  style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                if (isSetting)
                  Container(
                    color: Colors.amberAccent,
                    child: BuildSettingBox(
                      mode: mode,
                      count: count,
                      update: updateMode,
                    ),
                  ),
              ],
            ),
            Center(
              child: SizedBox(
                width: 200,
                height: 300,
                child: Stack(children: [
                  const Plate(),
                  buildDices(),
                  if (!mode && isHide) const Bowl(),
                ]),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (!mode && isHide) {
                    isHide = false;
                    setState(() {});
                  } else {
                    if (!mode) {
                      isHide = true;
                    }
                    rollDices();
                  }
                },
                child: Text((!mode && isHide) ? "Mở" : "Lắc"))
          ],
        ));
  }

  Widget buildDices() {
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
