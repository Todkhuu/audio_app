import 'dart:async';
import 'package:audio_app_2/managers/download_manager.dart';
import 'package:audio_app_2/models/audio_lesson.dart';
import 'package:audio_app_2/utils/mock_audio_lessons.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import '../notifiers/play_button_notifier.dart';
import '../notifiers/progress_notifier.dart';
import '../notifiers/repeat_button_notifier.dart';

class PageManager {
  final currentLessonNotifier = ValueNotifier<AudioLesson?>(null);
  final playlistNotifier = ValueNotifier<List<AudioLesson>>([]);
  final assetsLessonsNotifier = ValueNotifier<List<AudioLesson>>([]);
  final progressNotifier = ProgressNotifier();
  final repeatButtonNotifier = RepeatButtonNotifier();
  final isFirstSongNotifier = ValueNotifier<bool>(true);
  final isLastSongNotifier = ValueNotifier<bool>(true);
  final playButtonNotifier = PlayButtonNotifier();
  final speedNotifier = ValueNotifier<double>(1.0);
  final downloadedLessonsNotifier = ValueNotifier<List<AudioLesson>>([]);
  final selectedCategoryNotifier = ValueNotifier<String>("Бүгд");
  final countdownNotifiers = <String, ValueNotifier<Duration>>{};
  final downloadingLessonsNotifier = ValueNotifier<Set<String>>({});

  late AudioPlayer _audioPlayer;
  late ConcatenatingAudioSource _playlist;

  Timer? _countdownTimer;

  PageManager() {
    _init();
    _startCountdown();
  }

  void _init() async {
    _audioPlayer = AudioPlayer();
    _setInitialPlaylist();
    _listenForChangesInPlayerState();
    _listenForChangesInPlayerPosition();
    _listenForChangesInBufferedPosition();
    _listenForChangesInTotalDuration();
    _listenForChangesInSequenceState();
    _setInitialPlaylist();

    assetsLessonsNotifier.value = mockAudioLessons;
  }

  Future<void> _setInitialPlaylist() async {
    _playlist = ConcatenatingAudioSource(children: []);
  }

  void _listenForChangesInPlayerState() {
    _audioPlayer.playerStateStream.listen((playerState) {
      final isPlaying = playerState.playing;
      final processingState = playerState.processingState;
      if (processingState == ProcessingState.loading ||
          processingState == ProcessingState.buffering) {
        playButtonNotifier.value = ButtonState.loading;
      } else if (!isPlaying) {
        playButtonNotifier.value = ButtonState.paused;
      } else if (processingState != ProcessingState.completed) {
        playButtonNotifier.value = ButtonState.playing;
      } else {
        _audioPlayer.seek(Duration.zero);
        _audioPlayer.pause();
      }
    });
  }

  void _listenForChangesInPlayerPosition() {
    _audioPlayer.positionStream.listen((position) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: position,
        buffered: oldState.buffered,
        total: oldState.total,
      );
    });
  }

  void _listenForChangesInBufferedPosition() {
    _audioPlayer.bufferedPositionStream.listen((bufferedPosition) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: oldState.current,
        buffered: bufferedPosition,
        total: oldState.total,
      );
    });
  }

  void _listenForChangesInTotalDuration() {
    _audioPlayer.durationStream.listen((totalDuration) {
      final oldState = progressNotifier.value;
      final safeDuration = totalDuration ?? Duration.zero;
      progressNotifier.value = ProgressBarState(
        current: oldState.current,
        buffered: oldState.buffered,
        total: totalDuration ?? Duration.zero,
      );
      final lesson = currentLessonNotifier.value;
      if (lesson != null) {
        currentLessonNotifier.value = AudioLesson(
          id: lesson.id,
          title: lesson.title,
          lessonName: lesson.lessonName,
          lessonNumber: lesson.lessonNumber,
          startTime: lesson.startTime,
          duration: safeDuration,
          audioPath: lesson.audioPath,
          lessonDescription: lesson.lessonDescription,
          isLiked: lesson.isLiked,
          image: lesson.image,
          bgImage: lesson.bgImage,
          remainingDays: lesson.remainingDays,
          price: lesson.price,
          category: lesson.category,
        );
      }
    });
  }

  void _listenForChangesInSequenceState() {
    _audioPlayer.sequenceStateStream.listen((sequenceState) {
      final currentItem = sequenceState.currentSource;
      final lesson = currentItem?.tag as AudioLesson?;
      currentLessonNotifier.value = lesson;
      final playlist = sequenceState.effectiveSequence
          .where((item) => item.tag != null && item.tag is AudioLesson)
          .map((item) => item.tag as AudioLesson)
          .toList();
      playlistNotifier.value = playlist;

      if (playlist.isEmpty || currentItem == null) {
        isFirstSongNotifier.value = true;
        isLastSongNotifier.value = true;
      } else {
        isFirstSongNotifier.value = playlist.first == currentItem.tag;
        isLastSongNotifier.value = playlist.last == currentItem.tag;
      }
    });
  }

  void play() async {
    _audioPlayer.play();
  }

  void pause() {
    _audioPlayer.pause();
  }

  void seek(Duration position) {
    _audioPlayer.seek(position);
  }

  void dispose() {
    _audioPlayer.dispose();
    _countdownTimer?.cancel();
  }

  void onRepeatButtonPressed() {
    repeatButtonNotifier.nextState();
    switch (repeatButtonNotifier.value) {
      case RepeatState.off:
        _audioPlayer.setLoopMode(LoopMode.off);
        break;
      case RepeatState.repeatSong:
        _audioPlayer.setLoopMode(LoopMode.one);
        break;
      case RepeatState.repeatPlaylist:
        _audioPlayer.setLoopMode(LoopMode.all);
    }
  }

  void onPreviousSongButtonPressed() {
    _audioPlayer.seekToPrevious();
  }

  void onNextSongButtonPressed() {
    _audioPlayer.seekToNext();
  }

  void cycleSpeed() {
    double newSpeed;
    if (speedNotifier.value == 1.0) {
      newSpeed = 2.0;
    } else if (speedNotifier.value == 2.0) {
      newSpeed = 3.0;
    } else {
      newSpeed = 1.0;
    }
    speedNotifier.value = newSpeed;
    _audioPlayer.setSpeed(newSpeed);
  }

  void rewind5Seconds() {
    final currentPosition = _audioPlayer.position;
    Duration newPosition;

    if (currentPosition.inSeconds <= 5) {
      newPosition = Duration.zero;
    } else {
      newPosition = currentPosition - Duration(seconds: 5);
    }

    _audioPlayer.seek(newPosition);
  }

  void forward10Seconds() {
    final currentPosition = _audioPlayer.position;
    final totalDuration = _audioPlayer.duration ?? Duration.zero;

    Duration newPosition = currentPosition + Duration(seconds: 10);

    if (newPosition > totalDuration) {
      newPosition = totalDuration;
    }

    _audioPlayer.seek(newPosition);
  }

  bool get isPlaying {
    return _audioPlayer.playing;
  }

  void playLessonAt(int index) {
    if (index >= 0 && index < _playlist.children.length) {
      _audioPlayer.seek(Duration.zero, index: index);
      play();
    }
  }

  Future<void> downloadAndPlay(AudioLesson lesson) async {
    try {
      final localPath = await DownloadManager.downloadLesson(lesson);
      await DownloadManager.saveLesson(lesson, localPath);
      final updatedLessons = await DownloadManager.loadDownloadedLessons();
      downloadedLessonsNotifier.value = updatedLessons;

      await _playLocalFile(localPath, lesson);
    } catch (e) {
      print("Download болон тоглуулахад алдаа: $e");
    }
  }

  Future<void> refreshDownloads() async {
    downloadedLessonsNotifier.value =
        await DownloadManager.loadDownloadedLessons();
  }

  Future<void> deleteDownloadedLesson(AudioLesson lesson) async {
    await DownloadManager.deleteLesson(lesson);
    await refreshDownloads();
  }

  bool isLessonDownloaded(AudioLesson lesson) {
    return downloadedLessonsNotifier.value.any(
      (dl) => dl.lessonNumber == lesson.lessonNumber,
    );
  }

  Future<void> _playLocalFile(String filePath, AudioLesson lesson) async {
    final updatedLesson = AudioLesson(
      id: lesson.id,
      title: lesson.title,
      lessonName: lesson.lessonName,
      lessonNumber: lesson.lessonNumber,
      startTime: lesson.startTime,
      duration: lesson.duration,
      audioPath: filePath,
      lessonDescription: lesson.lessonDescription,
      isLiked: lesson.isLiked,
      image: lesson.image,
      bgImage: lesson.bgImage,
      remainingDays: lesson.remainingDays,
      price: lesson.price,
      category: lesson.category,
    );

    await _audioPlayer.stop();
    await _audioPlayer.setAudioSource(
      AudioSource.file(filePath, tag: updatedLesson),
    );
    currentLessonNotifier.value = updatedLesson;
    _audioPlayer.play();
  }

  Future<void> playAssetLesson(AudioLesson lesson) async {
    try {
      await _audioPlayer.stop();
      await _audioPlayer.setAudioSource(
        AudioSource.asset(lesson.audioPath, tag: lesson),
      );
      currentLessonNotifier.value = lesson;
      _audioPlayer.play();
    } catch (e) {
      print('Asset файл тоглуулахад алдаа гарлаа: $e');
    }
  }

  Future<void> playDownloadedLesson(AudioLesson lesson) async {
    try {
      await _playLocalFile(lesson.audioPath, lesson);
    } catch (e) {
      print('Download хийгдсэн файл тоглуулахад алдаа гарлаа: $e');
    }
  }

  List<AudioLesson> get filteredLessons {
    if (selectedCategoryNotifier.value == "Бүгд") {
      return assetsLessonsNotifier.value + downloadedLessonsNotifier.value;
    }
    return (assetsLessonsNotifier.value + downloadedLessonsNotifier.value)
        .where((lesson) => lesson.category == selectedCategoryNotifier.value)
        .toList();
  }

  Map<String, List<AudioLesson>> getLessonsByCategory() {
    final allLessons = assetsLessonsNotifier.value;
    // + downloadedLessonsNotifier.value
    final Map<String, List<AudioLesson>> categories = {};

    for (var lesson in allLessons) {
      if (categories.containsKey(lesson.category)) {
        categories[lesson.category]!.add(lesson);
      } else {
        categories[lesson.category] = [lesson];
      }
    }

    return categories;
  }

  void _startCountdown() {
    _countdownTimer = Timer.periodic(Duration(seconds: 1), (_) {
      final now = DateTime.now();
      final allLessons =
          assetsLessonsNotifier.value + downloadedLessonsNotifier.value;

      for (var lesson in allLessons) {
        if (lesson.endTime != null) {
          final remaining = lesson.endTime!.difference(now);
          if (!countdownNotifiers.containsKey(lesson.lessonNumber)) {
            countdownNotifiers[lesson.lessonNumber] = ValueNotifier(
              remaining.isNegative ? Duration.zero : remaining,
            );
          } else {
            countdownNotifiers[lesson.lessonNumber]!.value =
                remaining.isNegative ? Duration.zero : remaining;
          }
        }
      }
    });
  }

  ValueNotifier<Duration>? getCountdownNotifier(String lessonNumber) {
    return countdownNotifiers[lessonNumber];
  }

  Future<void> playNetworkLesson(AudioLesson lesson) async {
    try {
      await _audioPlayer.stop();
      await _audioPlayer.setAudioSource(
        AudioSource.uri(Uri.parse(lesson.audioPath), tag: lesson),
      );
      currentLessonNotifier.value = lesson;
      await _audioPlayer.play();
    } catch (e) {
      debugPrint("Network play error: $e");
    }
  }
}
