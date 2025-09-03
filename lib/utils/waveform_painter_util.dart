// waveform_painter_util.dart
import 'package:flutter/material.dart';
import 'dart:math' as math;

class WaveformPainterUtil extends CustomPainter {
  final List<double> amplitudes;
  final double progress;
  final double animationValue;
  final bool isPlaying;

  WaveformPainterUtil({
    required this.amplitudes,
    required this.progress,
    this.animationValue = 0.0,
    this.isPlaying = false,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (amplitudes.isEmpty) return;

    final widthPerBar = size.width / amplitudes.length;
    final barWidth = widthPerBar * 0.7; // Bar-ын өргөн

    // Background bars (тоглогдоогүй хэсэг)
    final inactivePaint = Paint()
      ..color = const Color(0xFFCAD0D7)
      ..strokeWidth = barWidth
      ..strokeCap = StrokeCap.round;

    // Active bars (тоглогдсон хэсэг)
    final activePaint = Paint()
      ..color =
          const Color(0xFFFF6B35) // Улбар шар өнгө
      ..strokeWidth = barWidth
      ..strokeCap = StrokeCap.round;

    for (int i = 0; i < amplitudes.length; i++) {
      final x = i * widthPerBar + widthPerBar / 2;

      // Анимация эффект
      double currentAmplitude = amplitudes[i];

      if (isPlaying && i <= (progress * amplitudes.length)) {
        // Тоглож байгаа хэсэгт анимация нэмэх
        final wave = math.sin((i * 0.3) + (animationValue * 10)) * 0.1;
        currentAmplitude = (amplitudes[i] + wave).clamp(0.1, 1.0);
      }

      final barHeight = currentAmplitude * size.height * 0.8;
      final y1 = (size.height - barHeight) / 2;
      final y2 = y1 + barHeight;

      // Прогрессээр нь өнгө өөрчлөх
      final paint = i <= (progress * amplitudes.length)
          ? activePaint
          : inactivePaint;

      canvas.drawLine(Offset(x, y1), Offset(x, y2), paint);
    }

    // Одоогийн байрлалыг харуулах indicator
    if (progress > 0) {
      final indicatorX = size.width * progress;
      final indicatorPaint = Paint()
        ..color = const Color(0xFFFF6B35)
        ..strokeWidth = 3;

      canvas.drawLine(
        Offset(indicatorX, 10),
        Offset(indicatorX, size.height - 10),
        indicatorPaint,
      );

      // Indicator дээр цэг
      canvas.drawCircle(
        Offset(indicatorX, size.height / 2),
        6,
        Paint()
          ..color = const Color(0xFFFF6B35)
          ..style = PaintingStyle.fill,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate is! WaveformPainterUtil ||
        oldDelegate.progress != progress ||
        oldDelegate.animationValue != animationValue ||
        oldDelegate.isPlaying != isPlaying;
  }
}
