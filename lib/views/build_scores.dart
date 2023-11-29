import 'package:app/models/quadrilateral_model.dart';
import 'package:flutter/material.dart';

void buildScores(Paint paint, Canvas canvas, QuadrilateralModel quadrilateral,
    bool? isLeft) {
  switch (quadrilateral.value) {
    case 1:
      buildOneScore(paint, canvas, quadrilateral);
      break;
    case 2:
      buildTwoScore(paint, canvas, quadrilateral, isLeft);
      break;
    case 3:
      buildThreeScore(paint, canvas, quadrilateral, isLeft);
      break;
    case 4:
      buildFourScore(paint, canvas, quadrilateral, isLeft);
      break;
    case 5:
      buildFiveScore(paint, canvas, quadrilateral, isLeft);
      break;
    case 6:
      buildSixScore(paint, canvas, quadrilateral, isLeft);
      break;
  }
}

void buildOneScore(
    Paint paint, Canvas canvas, QuadrilateralModel quadrilateral) {
  paint.color = Colors.redAccent;
  canvas.drawCircle(
    Offset(
      (quadrilateral.top.dx +
              quadrilateral.right.dx +
              quadrilateral.bottom.dx +
              quadrilateral.left.dx) /
          4,
      (quadrilateral.top.dy +
              quadrilateral.right.dy +
              quadrilateral.bottom.dy +
              quadrilateral.left.dy) /
          4,
    ),
    10,
    paint,
  );
}

void buildTwoScore(Paint paint, Canvas canvas, QuadrilateralModel quadrilateral,
    bool? isLeft) {
  paint.color = Colors.black;
  Offset point;

  if (isLeft != null) {
    if (!isLeft) {
      point = Offset(
        (quadrilateral.top.dx + quadrilateral.bottom.dx) / 2,
        (quadrilateral.top.dy + quadrilateral.bottom.dy) / 2,
      );

      canvas.drawCircle(
        Offset(point.dx + 12, point.dy - 20),
        5,
        paint,
      );

      canvas.drawCircle(
        Offset(point.dx - 12, point.dy + 20),
        5,
        paint,
      );
    } else {
      point = Offset(
        (quadrilateral.left.dx + quadrilateral.right.dx) / 2,
        (quadrilateral.left.dy + quadrilateral.right.dy) / 2,
      );

      canvas.drawCircle(
        Offset(point.dx + 15, point.dy + 2),
        5,
        paint,
      );

      canvas.drawCircle(
        Offset(point.dx - 15, point.dy - 2),
        5,
        paint,
      );
    }
  } else {
    point = Offset(
      (quadrilateral.left.dx + quadrilateral.right.dx) / 2,
      (quadrilateral.left.dy + quadrilateral.right.dy) / 2,
    );

    canvas.drawCircle(
      Offset(point.dx + 15, point.dy + 2),
      5,
      paint,
    );

    canvas.drawCircle(
      Offset(point.dx - 15, point.dy - 2),
      5,
      paint,
    );
  }
}

void buildThreeScore(Paint paint, Canvas canvas,
    QuadrilateralModel quadrilateral, bool? isLeft) {
  paint.color = Colors.black;
  Offset point;

  if (isLeft != null) {
    if (!isLeft) {
      point = Offset(
        (quadrilateral.top.dx + quadrilateral.bottom.dx) / 2,
        (quadrilateral.top.dy + quadrilateral.bottom.dy) / 2,
      );

      canvas.drawCircle(
        Offset(point.dx + 12, point.dy - 20),
        5,
        paint,
      );

      canvas.drawCircle(
        Offset(point.dx, point.dy),
        5,
        paint,
      );

      canvas.drawCircle(
        Offset(point.dx - 12, point.dy + 20),
        5,
        paint,
      );
    } else {
      point = Offset(
        (quadrilateral.left.dx + quadrilateral.right.dx) / 2,
        (quadrilateral.left.dy + quadrilateral.right.dy) / 2,
      );

      canvas.drawCircle(
        Offset(point.dx + 15, point.dy + 2),
        5,
        paint,
      );

      canvas.drawCircle(
        Offset(point.dx, point.dy),
        5,
        paint,
      );

      canvas.drawCircle(
        Offset(point.dx - 15, point.dy - 2),
        5,
        paint,
      );
    }
  } else {
    point = Offset(
      (quadrilateral.left.dx + quadrilateral.right.dx) / 2,
      (quadrilateral.left.dy + quadrilateral.right.dy) / 2,
    );

    canvas.drawCircle(
      Offset(point.dx - 20, point.dy),
      5,
      paint,
    );

    canvas.drawCircle(
      Offset(point.dx, point.dy),
      5,
      paint,
    );

    canvas.drawCircle(
      Offset(point.dx + 20, point.dy),
      5,
      paint,
    );
  }
}

void buildFourScore(Paint paint, Canvas canvas,
    QuadrilateralModel quadrilateral, bool? isLeft) {
  paint.color = Colors.black;
  Offset point;

  if (isLeft != null) {
    if (!isLeft) {
      point = Offset(
        (quadrilateral.top.dx + quadrilateral.bottom.dx) / 2,
        (quadrilateral.top.dy + quadrilateral.bottom.dy) / 2,
      );

      canvas.drawCircle(
        Offset(point.dx - 10, point.dy),
        5,
        paint,
      );

      canvas.drawCircle(
        Offset(point.dx - 10, point.dy + 20),
        5,
        paint,
      );

      canvas.drawCircle(
        Offset(point.dx + 10, point.dy - 20),
        5,
        paint,
      );

      canvas.drawCircle(
        Offset(point.dx + 10, point.dy),
        5,
        paint,
      );
    } else {
      point = Offset(
        (quadrilateral.left.dx + quadrilateral.right.dx) / 2,
        (quadrilateral.left.dy + quadrilateral.right.dy) / 2,
      );

      canvas.drawCircle(
        Offset(point.dx - 10, point.dy - 20),
        5,
        paint,
      );

      canvas.drawCircle(
        Offset(point.dx - 10, point.dy),
        5,
        paint,
      );

      canvas.drawCircle(
        Offset(point.dx + 10, point.dy),
        5,
        paint,
      );

      canvas.drawCircle(
        Offset(point.dx + 10, point.dy + 20),
        5,
        paint,
      );
    }
  }else {
      point = Offset(
        (quadrilateral.left.dx + quadrilateral.right.dx) / 2,
        (quadrilateral.left.dy + quadrilateral.right.dy) / 2,
      );

      canvas.drawCircle(
        Offset(point.dx, point.dy - 15),
        5,
        paint,
      );

      canvas.drawCircle(
        Offset(point.dx - 15, point.dy),
        5,
        paint,
      );

      canvas.drawCircle(
        Offset(point.dx + 15, point.dy),
        5,
        paint,
      );

      canvas.drawCircle(
        Offset(point.dx, point.dy + 15),
        5,
        paint,
      );
    }
}

void buildFiveScore(Paint paint, Canvas canvas,
    QuadrilateralModel quadrilateral, bool? isLeft) {
  paint.color = Colors.black;
  Offset point;

  if (isLeft != null) {
    if (!isLeft) {
      point = Offset(
        (quadrilateral.top.dx + quadrilateral.bottom.dx) / 2,
        (quadrilateral.top.dy + quadrilateral.bottom.dy) / 2,
      );

      canvas.drawCircle(
        Offset(point.dx + 15, point.dy),
        5,
        paint,
      );

      canvas.drawCircle(
        Offset(point.dx + 12, point.dy - 20),
        5,
        paint,
      );

      canvas.drawCircle(
        Offset(point.dx, point.dy),
        5,
        paint,
      );

      canvas.drawCircle(
        Offset(point.dx - 12, point.dy + 20),
        5,
        paint,
      );

      canvas.drawCircle(
        Offset(point.dx - 15, point.dy),
        5,
        paint,
      );
    } else {
      point = Offset(
        (quadrilateral.left.dx + quadrilateral.right.dx) / 2,
        (quadrilateral.left.dy + quadrilateral.right.dy) / 2,
      );

      canvas.drawCircle(
        Offset(point.dx - 12, point.dy - 20),
        5,
        paint,
      );

      canvas.drawCircle(
        Offset(point.dx + 12, point.dy),
        5,
        paint,
      );

      canvas.drawCircle(
        Offset(point.dx, point.dy),
        5,
        paint,
      );

      canvas.drawCircle(
        Offset(point.dx - 12, point.dy),
        5,
        paint,
      );

      canvas.drawCircle(
        Offset(point.dx + 12, point.dy + 20),
        5,
        paint,
      );
    }
  }else {
      point = Offset(
        (quadrilateral.left.dx + quadrilateral.right.dx) / 2,
        (quadrilateral.left.dy + quadrilateral.right.dy) / 2,
      );

      canvas.drawCircle(
        Offset(point.dx, point.dy - 20),
        5,
        paint,
      );

      canvas.drawCircle(
        Offset(point.dx -20, point.dy),
        5,
        paint,
      );

      canvas.drawCircle(
        Offset(point.dx, point.dy),
        5,
        paint,
      );

      canvas.drawCircle(
        Offset(point.dx + 20, point.dy),
        5,
        paint,
      );

      canvas.drawCircle(
        Offset(point.dx, point.dy + 20),
        5,
        paint,
      );
    }
}

void buildSixScore(Paint paint, Canvas canvas, QuadrilateralModel quadrilateral,
    bool? isLeft) {
  paint.color = Colors.black;
  Offset point;

  if (isLeft != null) {
    if (!isLeft) {
      point = Offset(
        (quadrilateral.top.dx + quadrilateral.bottom.dx) / 2,
        (quadrilateral.top.dy + quadrilateral.bottom.dy) / 2,
      );

      canvas.drawCircle(
        Offset(point.dx + 12, point.dy),
        5,
        paint,
      );

      canvas.drawCircle(
        Offset(point.dx + 12, point.dy - 20),
        5,
        paint,
      );

      canvas.drawCircle(
        Offset(point.dx - 1, point.dy - 8),
        5,
        paint,
      );

      canvas.drawCircle(
        Offset(point.dx + 2, point.dy + 10),
        5,
        paint,
      );

      canvas.drawCircle(
        Offset(point.dx - 10, point.dy + 22),
        5,
        paint,
      );

      canvas.drawCircle(
        Offset(point.dx - 12, point.dy + 2),
        5,
        paint,
      );
    } else {
      point = Offset(
        (quadrilateral.left.dx + quadrilateral.right.dx) / 2,
        (quadrilateral.left.dy + quadrilateral.right.dy) / 2,
      );

      canvas.drawCircle(
        Offset(point.dx - 12, point.dy - 20),
        5,
        paint,
      );

      canvas.drawCircle(
        Offset(point.dx + 12, point.dy),
        5,
        paint,
      );

      canvas.drawCircle(
        Offset(point.dx + 1, point.dy - 10),
        5,
        paint,
      );

      canvas.drawCircle(
        Offset(point.dx - 1, point.dy + 10),
        5,
        paint,
      );

      canvas.drawCircle(
        Offset(point.dx - 12, point.dy),
        5,
        paint,
      );

      canvas.drawCircle(
        Offset(point.dx + 12, point.dy + 20),
        5,
        paint,
      );
    }
  }else {
      point = Offset(
        (quadrilateral.left.dx + quadrilateral.right.dx) / 2,
        (quadrilateral.left.dy + quadrilateral.right.dy) / 2,
      );

      canvas.drawCircle(
        Offset(point.dx, point.dy - 20),
        5,
        paint,
      );

      canvas.drawCircle(
        Offset(point.dx + 10, point.dy - 10),
        5,
        paint,
      );

      canvas.drawCircle(
        Offset(point.dx + 20, point.dy),
        5,
        paint,
      );

      canvas.drawCircle(
        Offset(point.dx - 20, point.dy),
        5,
        paint,
      );

      canvas.drawCircle(
        Offset(point.dx - 10, point.dy + 10),
        5,
        paint,
      );

      canvas.drawCircle(
        Offset(point.dx, point.dy + 20),
        5,
        paint,
      );
    }
}
