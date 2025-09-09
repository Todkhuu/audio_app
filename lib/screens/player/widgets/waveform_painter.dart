// waveform_painter.dart
import 'package:audio_app_2/notifiers/progress_notifier.dart';
import 'package:audio_app_2/managers/page_manager.dart';
import 'package:audio_app_2/utils/waveform_painter_util.dart';
import 'package:flutter/material.dart';

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
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    // Waveform data үүсгэх (жинхэнэ аудио файлаас авч болно)
    _generateWaveformData();

    // Анимацийг эхлүүлэх
    _animationController.repeat();
  }

  void _generateWaveformData() {
    // Илүү реалистик waveform pattern
    amplitudes = List.generate(120, (index) {
      if (index < 20) {
        // Эхлэл - намуухан
        return (index / 20.0) * 0.4 + 0.1;
      } else if (index < 80) {
        // Дунд хэсэг - өндөр
        final base = 0.3 + (index % 15) / 15.0 * 0.6;
        final variation = (index % 7) / 7.0 * 0.3;
        return base + variation;
      } else {
        // Төгсгөл - намуухан
        final remaining = 120 - index;
        return (remaining / 40.0) * 0.5 + 0.1;
      }
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

        final isPlaying = widget.pageManager.isPlaying;

        return GestureDetector(
          onTapDown: (details) => _onSeek(details, context, progressState),
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return CustomPaint(
                size: Size(MediaQuery.of(context).size.width, 100),
                painter: WaveformPainterUtil(
                  amplitudes: amplitudes,
                  progress: progress,
                  animationValue: isPlaying ? _animationController.value : 0.0,
                  isPlaying: isPlaying,
                ),
              );
            },
          ),
        );
      },
    );
  }

  void _onSeek(
    TapDownDetails details,
    BuildContext context,
    ProgressBarState progressState,
  ) {
    final screenWidth = MediaQuery.of(context).size.width;
    final tapPosition = details.localPosition.dx;
    final seekProgress = (tapPosition / screenWidth).clamp(0.0, 1.0);

    if (progressState.total.inMilliseconds > 0) {
      final seekPosition = Duration(
        milliseconds: (progressState.total.inMilliseconds * seekProgress)
            .round(),
      );
      widget.pageManager.seek(seekPosition);
    }
  }
}

// PageManager классд нэмэх methods (хэрэв байхгүй бол)
/*
class PageManager {
  // ... бусад кодууд

  bool get isPlaying {
    // AudioPlayer-ийн playing state-ийг буцаах
    return _audioPlayer.playing;
  }

  void seek(Duration position) {
    _audioPlayer.seek(position);
  }

  // ... бусад кодууд
}
*/
