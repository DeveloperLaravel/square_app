import 'dart:math';

import 'package:flutter/material.dart';

class ClockPainter extends CustomPainter {
  final DateTime time;

  ClockPainter(this.time);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(
      size.width / 2,
      size.height / 2,
    );

    final radius = size.width / 2;

    // خلفية الساعة
    final backgroundPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      center,
      radius,
      backgroundPaint,
    );

    // إطار الساعة
    final borderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;

    canvas.drawCircle(
      center,
      radius - 4,
      borderPaint,
    );

    // أرقام الساعة
    final textStyle = const TextStyle(
      color: Colors.black,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    );

    for (int i = 1; i <= 12; i++) {
      final angle = (i * pi / 6) - pi / 2;

      final x = center.dx + cos(angle) * (radius - 40);
      final y = center.dy + sin(angle) * (radius - 40);

      final textPainter = TextPainter(
        text: TextSpan(
          text: '$i',
          style: textStyle,
        ),
        textDirection: TextDirection.ltr,
      );

      textPainter.layout();

      textPainter.paint(
        canvas,
        Offset(
          x - textPainter.width / 2,
          y - textPainter.height / 2,
        ),
      );
    }

    // عقرب الساعات
    final hour = time.hour % 12;
    final hourAngle =
        ((hour + time.minute / 60) * pi / 6) - pi / 2;

    drawHand(
      canvas,
      center,
      hourAngle,
      radius * 0.50,
      10,
      Colors.black,
    );

    // عقرب الدقائق
    final minuteAngle =
        ((time.minute + time.second / 60) * pi / 30) - pi / 2;

    drawHand(
      canvas,
      center,
      minuteAngle,
      radius * 0.70,
      7,
      Colors.black,
    );

    // عقرب الثواني
    final secondAngle =
        (time.second * pi / 30) - pi / 2;

    drawHand(
      canvas,
      center,
      secondAngle,
      radius * 0.80,
      3,
      Colors.red,
    );

    // الدائرة الموجودة في المنتصف
    final centerPaint = Paint()
      ..color = Colors.red;

    canvas.drawCircle(
      center,
      8,
      centerPaint,
    );
  }

  void drawHand(
    Canvas canvas,
    Offset center,
    double angle,
    double length,
    double width,
    Color color,
  ) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = width
      ..strokeCap = StrokeCap.round;

    final end = Offset(
      center.dx + cos(angle) * length,
      center.dy + sin(angle) * length,
    );

    canvas.drawLine(
      center,
      end,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant ClockPainter oldDelegate) {
    return oldDelegate.time != time;
  }
}