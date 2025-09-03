import 'package:audio_app_2/models/audio_lesson.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'notifiers/play_button_notifier.dart';
import 'notifiers/progress_notifier.dart';
import 'notifiers/repeat_button_notifier.dart';

class PageManager {
  final currentLessonNotifier = ValueNotifier<AudioLesson?>(null);
  final playlistNotifier = ValueNotifier<List<AudioLesson>>([]);
  final progressNotifier = ProgressNotifier();
  final repeatButtonNotifier = RepeatButtonNotifier();
  final isFirstSongNotifier = ValueNotifier<bool>(true);
  final playButtonNotifier = PlayButtonNotifier();
  final isLastSongNotifier = ValueNotifier<bool>(true);
  final speedNotifier = ValueNotifier<double>(1.0);

  late AudioPlayer _audioPlayer;
  late ConcatenatingAudioSource _playlist;

  PageManager() {
    _init();
  }

  void _init() async {
    _audioPlayer = AudioPlayer();
    _setInitialPlaylist();
    _listenForChangesInPlayerState();
    _listenForChangesInPlayerPosition();
    _listenForChangesInBufferedPosition();
    _listenForChangesInTotalDuration();
    _listenForChangesInSequenceState();
  }

  Future<void> _setInitialPlaylist() async {
    final lessons = [
      AudioLesson(
        title: "Бясалгал 1",
        lessonNumber: "Хичээл 1",
        startTime: "06:00",
        duration: Duration.zero,
        audioPath: 'assets/audio/good.mp3',
      ),
      AudioLesson(
        title: "Бясалгал 2",
        lessonNumber: "Хичээл 2",
        startTime: "07:00",
        duration: Duration.zero,
        audioPath: 'assets/audio/study.mp3',
      ),
    ];

    _playlist = ConcatenatingAudioSource(
      children: lessons
          .map((lesson) => AudioSource.asset(lesson.audioPath, tag: lesson))
          .toList(),
    );

    await _audioPlayer.setAudioSource(_playlist);
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
      // duration-г одоогийн хичээл дээр update хийх
      final lesson = currentLessonNotifier.value;
      if (lesson != null) {
        currentLessonNotifier.value = AudioLesson(
          title: lesson.title,
          lessonNumber: lesson.lessonNumber,
          startTime: lesson.startTime,
          duration: safeDuration,
          audioPath: lesson.audioPath,
        );
      }
    });
  }

  void _listenForChangesInSequenceState() {
    _audioPlayer.sequenceStateStream.listen((sequenceState) {
      final currentItem = sequenceState.currentSource;
      final lesson = currentItem?.tag as AudioLesson?;
      currentLessonNotifier.value = lesson;

      // update playlist
      final playlist = sequenceState.effectiveSequence
          .map((item) => item.tag as AudioLesson)
          .toList();
      playlistNotifier.value = playlist;

      // update previous and next buttons
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
    // AudioPlayer-ийн playing state-ийг буцаах
    return _audioPlayer.playing;
  }
}
