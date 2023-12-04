import 'package:flutter/material.dart';

class Plate extends StatelessWidget {
  const Plate({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: CustomPaint(
        painter: PlatePainter(),
        foregroundPainter: BottomPlate(),
      ),
    );
  }
}

class PlatePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final center = Offset(size.width / 2, size.height / 2);
    final horizontalRadius = size.width -20;
    final verticalRadius = size.height / 2;

    canvas.drawOval(
        Rect.fromCenter(
            center: center,
            width: horizontalRadius * 2,
            height: verticalRadius * 2),
        paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class BottomPlate extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color.fromARGB(255, 223, 239, 245)
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);
    final horizontalRadius = size.width / 1.5;
    final verticalRadius = size.height / 2.5;

    canvas.drawOval(
      Rect.fromCenter(
          center: center,
          width: horizontalRadius * 2,
          height: verticalRadius * 2),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
