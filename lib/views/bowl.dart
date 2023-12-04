import 'package:flutter/material.dart';

class Bowl extends StatelessWidget {
  const Bowl({super.key, required this.state});
  final state;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      child: CustomPaint(
        painter: BowlPainter(state),
        foregroundPainter: BottomBowl(),
      ),
    );
  }
}

class BowlPainter extends CustomPainter {
  BowlPainter(this.state);
  final state;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blueGrey
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);
    final horizontalRadius = size.width / 1.4;
    final verticalRadius = size.height / 2.2;
    if (state.widthBowl == null) {
      state.setSizeBowl(size.width, size.height);
    }

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

class BottomBowl extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20;

    final center = Offset(size.width / 2, size.height / 3);
    final horizontalRadius = size.width / 3;
    final verticalRadius = size.height / 5.5;

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
