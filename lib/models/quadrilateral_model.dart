import 'package:flutter/material.dart';

class QuadrilateralModel {
  int value;
  Offset top;
  Offset right;
  Offset bottom;
  Offset left;

  factory QuadrilateralModel() {
    return QuadrilateralModel.info(
      value: 6,
      top: const Offset(50.0, 0.0),
      right: const Offset(100.0, 50.0),
      bottom: const Offset(50.0, 100.0),
      left: const Offset(0.0, 150.0),
    );
  }

  QuadrilateralModel.info({
    required this.value,
    required this.top,
    required this.right,
    required this.bottom,
    required this.left,
  });
}
