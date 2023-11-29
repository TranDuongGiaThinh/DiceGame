import 'package:app/models/quadrilateral_model.dart';
import 'package:app/views/build_scores.dart';
import 'package:flutter/material.dart';

class Quadrilateral extends StatelessWidget {
  final QuadrilateralModel quadrilateral;
  final bool? isLeft;

  const Quadrilateral({super.key, required this.quadrilateral, this.isLeft});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        painter: QuadrilateralPainter(quadrilateral, isLeft),
      ),
    );
  }
}

class QuadrilateralPainter extends CustomPainter {
  final QuadrilateralModel quadrilateral;
  bool ? isLeft;

  QuadrilateralPainter(this.quadrilateral, this.isLeft);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2.0
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(quadrilateral.top.dx, quadrilateral.top.dy)
      ..lineTo(quadrilateral.right.dx, quadrilateral.right.dy)
      ..lineTo(quadrilateral.bottom.dx, quadrilateral.bottom.dy)
      ..lineTo(quadrilateral.left.dx, quadrilateral.left.dy)
      ..close();
    canvas.drawPath(path, paint);

    final borderPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;
    canvas.drawPath(path, borderPaint);

    buildScores(paint, canvas, quadrilateral, isLeft);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
