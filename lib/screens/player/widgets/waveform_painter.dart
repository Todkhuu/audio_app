// waveform_painter.dart
import 'package:flutter/material.dart';
import 'package:audio_app_2/managers/page_manager.dart';
import 'package:audio_app_2/notifiers/progress_notifier.dart';

class WaveformPainter extends StatefulWidget {
  const WaveformPainter({super.key, required this.pageManager});
  final PageManager pageManager;

  @override
  State<WaveformPainter> createState() => _WaveformPainterState();
}

class _WaveformPainterState extends State<WaveformPainter>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  List<double> amplitudes = [];

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    )..repeat();

    _generateWaveformData();
  }

  void _generateWaveformData() {
    amplitudes = List.generate(120, (index) {
      if (index < 20) return (index / 20.0) * 0.4 + 0.1;
      if (index < 80) return 0.3 + (index % 15) / 15.0 * 0.6;
      final remaining = 120 - index;
      return (remaining / 40.0) * 0.5 + 0.1;
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ProgressBarState>(
      valueListenable: widget.pageManager.progressNotifier,
      builder: (context, progressState, _) {
        final progress = progressState.total.inMilliseconds == 0
            ? 0.0
            : progressState.current.inMilliseconds /
                  progressState.total.inMilliseconds;

        return GestureDetector(
          onTapDown: (details) => _onSeek(details, context, progressState),
          child: Center(
            child: SizedBox(
              width: double.infinity,
              height: 40,
              child: CustomPaint(
                painter: _WaveformPainterUtil(
                  amplitudes: amplitudes,
                  progress: progress,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _onSeek(
    TapDownDetails details,
    BuildContext context,
    ProgressBarState state,
  ) {
    final screenWidth = MediaQuery.of(context).size.width;
    final tapPosition = details.localPosition.dx;
    final seekProgress = (tapPosition / screenWidth).clamp(0.0, 1.0);

    if (state.total.inMilliseconds > 0) {
      final seekPosition = Duration(
        milliseconds: (state.total.inMilliseconds * seekProgress).round(),
      );
      widget.pageManager.seek(seekPosition);
    }
  }
}

class _WaveformPainterUtil extends CustomPainter {
  final List<double> amplitudes;
  final double progress;

  _WaveformPainterUtil({required this.amplitudes, required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final barWidth = size.width / amplitudes.length;

    final backgroundPaint = Paint()
      ..color = Colors.grey.withOpacity(0.4)
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    final progressPaint = Paint()
      ..color = Color(0xFFF5B945)
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    for (int i = 0; i < amplitudes.length; i++) {
      final x = i * barWidth;
      final amp =
          amplitudes[i] * size.height * 0.5; // хөдөлгөөнгүй, статик өндөр

      final start = Offset(x, size.height);
      final end = Offset(x, size.height - amp);

      // Progress хүрсэн хэсгийг цэнхэрээр, бусдыг саарал
      if (i / amplitudes.length <= progress) {
        canvas.drawLine(start, end, progressPaint);
      } else {
        canvas.drawLine(start, end, backgroundPaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
