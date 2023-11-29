import 'dart:math';

import 'package:app/models/quadrilateral_model.dart';
import 'package:flutter/material.dart';

class DiceMode {
  int value;
  Offset point;
  QuadrilateralModel? qMain;
  QuadrilateralModel? qLeft;
  QuadrilateralModel? qRight;

  DiceMode({required this.value, required this.point}) {
    qMain = QuadrilateralModel.info(
        value: value,
        top: Offset(point.dx, point.dy - 100),
        right: Offset(point.dx + 50, point.dy - 50),
        bottom: Offset(point.dx, point.dy),
        left: Offset(point.dx - 50, point.dy - 50));

    List<int> list = [1, 2, 3, 4, 5, 6];
    list.remove(value);
    list.remove(7 - value);
    int index = Random().nextInt(list.length);

    qLeft = QuadrilateralModel.info(
        value: list[index],
        top: Offset(point.dx - 50, point.dy - 50),
        right: Offset(point.dx, point.dy),
        bottom: Offset(point.dx, point.dy + 50),
        left: Offset(point.dx - 50, point.dy));

    int x = list[index];
    list.remove(7 - x);
    list.remove(x);

    qRight = QuadrilateralModel.info(
        value: list[Random().nextInt(list.length)],
        top: Offset(point.dx + 50, point.dy - 50),
        right: Offset(point.dx + 50, point.dy),
        bottom: Offset(point.dx, point.dy + 50),
        left: Offset(point.dx, point.dy));
  }
}
