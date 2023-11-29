import 'package:flutter/material.dart';

class Bowl extends StatelessWidget {
  const Bowl({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 20,
      height: MediaQuery.of(context).size.width - 100,
      child: CustomPaint(
        painter: BowlPainter(),
      ),
    );
  }
}

class BowlPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);
    final horizontalRadius = size.width /1.5 ;
    final verticalRadius = size.height / 2.3;

    canvas.drawOval(Rect.fromCenter(center: center, width: horizontalRadius * 2, height: verticalRadius * 2), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}