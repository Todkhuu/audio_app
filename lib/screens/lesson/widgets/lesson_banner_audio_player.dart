import 'package:audio_app_2/controller/overlay_controller.dart';
import 'package:audio_app_2/managers/page_manager.dart';
import 'package:audio_app_2/models/audio_lesson.dart';
import 'package:audio_app_2/screens/lesson/widgets/audio_progress_bar.dart';
import 'package:audio_app_2/screens/lesson/widgets/opacity_overlay.dart';
import 'package:audio_app_2/screens/lesson/widgets/play_pause_button.dart';
import 'package:audio_app_2/screens/lesson/widgets/rating_widget.dart';
import 'package:flutter/material.dart';

class LessonBannerAudioPlayer extends StatefulWidget {
  final AudioLesson lesson;
  final PageManager pageManager;

  const LessonBannerAudioPlayer({
    super.key,
    required this.lesson,
    required this.pageManager,
  });

  @override
  State<LessonBannerAudioPlayer> createState() =>
      _LessonBannerAudioPlayerState();
}

class _LessonBannerAudioPlayerState extends State<LessonBannerAudioPlayer> {
  @override
  void initState() {
    super.initState();
    _playLesson();
  }

  void _playLesson() async {
    final path = widget.lesson.audioPath;

    if (path.startsWith('assets')) {
      // assets дээрх аудио
      await widget.pageManager.playAssetLesson(widget.lesson);
    } else if (path.startsWith('http')) {
      // network URL
      await widget.pageManager.playNetworkLesson(widget.lesson);
    } else {
      // татаж авсан local файл
      await widget.pageManager.playDownloadedLesson(widget.lesson);
    }
  }

  @override
  Widget build(BuildContext context) {
    final overlayController = OverlayController();
    return GestureDetector(
      onTap: overlayController.toggle,
      child: Stack(
        children: [
          // Зураг
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                widget.lesson.bgImage,
                height: 195,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Rating
          Positioned(
            top: 30,
            left: 35,
            child: RatingWidget(rate: widget.lesson.rate!),
          ),

          // Overlay
          ValueListenableBuilder<bool>(
            valueListenable: overlayController.isVisible,
            builder: (_, isVisible, __) {
              if (!isVisible) return const SizedBox.shrink();
              return Stack(
                children: [
                  OpacityOverlay(),
                  PlayPauseButton(pageManager: widget.pageManager),
                  AudioProgressBar(pageManager: widget.pageManager),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
