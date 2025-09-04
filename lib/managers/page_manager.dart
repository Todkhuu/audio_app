import 'dart:convert';
import 'package:audio_app_2/models/audio_lesson.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../notifiers/play_button_notifier.dart';
import '../notifiers/progress_notifier.dart';
import '../notifiers/repeat_button_notifier.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class PageManager {
  // <-- 1. State & Notifiers – UI update хийх. -->

  // Одоо тоглож буй хичээл
  final currentLessonNotifier = ValueNotifier<AudioLesson?>(null);
  // Playlist-д байгаа бүх хичээлүүдийн жагсаалт.
  final playlistNotifier = ValueNotifier<List<AudioLesson>>([]);
  // Assets файлуудын жагсаалт (Home page-д харуулахад)
  final assetsLessonsNotifier = ValueNotifier<List<AudioLesson>>([]);
  // Audio progress bar-ийн мэдээлэл (одоо, buffered, нийт хугацаа).
  final progressNotifier = ProgressNotifier();
  // Дахин тоглох товчны state (off, нэг дуу, playlist).
  final repeatButtonNotifier = RepeatButtonNotifier();
  // Playlist-ийн эх, сүүлд тоглож буй эсэхийг тэмдэглэнэ.
  final isFirstSongNotifier = ValueNotifier<bool>(true);
  final isLastSongNotifier = ValueNotifier<bool>(true);
  // Тоглох/Pause/Loading товчны state.
  final playButtonNotifier = PlayButtonNotifier();
  // Тоглуулах хурд (1x, 2x, 3x).
  final speedNotifier = ValueNotifier<double>(1.0);
  final downloadedLessonsNotifier = ValueNotifier<List<AudioLesson>>([]);

  late AudioPlayer _audioPlayer;
  late ConcatenatingAudioSource _playlist;

  // Assets файлуудын жагсаалт
  final List<AudioLesson> _assetsLessons = [
    AudioLesson(
      title: "Сэтгэлийн хүчээ мэдэр",
      lessonName: 'Бясалгал 1',
      lessonNumber: "Хичээл 1",
      startTime: "06:00",
      duration: Duration.zero,
      audioPath: 'assets/audio/good.mp3',
      lessonDescription:
          '12-р сарын 6-ны еглее 04 цагт хийнэ, орой 18 цагаас давтаж хийнэ.',
      image: 'assets/images/bg/setgelsmall.png',
      bgImage: 'assets/images/bg/setgelbg.png',
      remainingDays: '5',
      price: 289000,
    ),
    AudioLesson(
      title: "Эдгэрэлийн дасгалжуулалт",
      lessonName: 'Бясалгал 2',
      lessonNumber: "Хичээл 2",
      startTime: "07:00",
      duration: Duration.zero,
      audioPath: 'assets/audio/study.mp3',
      lessonDescription:
          '12-р сарын 8-ны еглее 04 цагт хийнэ, орой 20 цагаас давтаж хийнэ.',
      image: 'assets/images/bg/edgerelsmall.png',
      bgImage: 'assets/images/bg/edgerelbg.png',
      remainingDays: '10',
      price: 258300,
    ),
  ];

  PageManager() {
    _init();
  }

  // <-- 2. Init & Playlist – AudioPlayer initialize, playlist set. -->
  // AudioPlayer үүсгэх, playlist set хийх, listener-уудыг ажиллуулах.
  void _init() async {
    _audioPlayer = AudioPlayer();
    await _loadDownloadedLessons();
    _setInitialPlaylist();
    _listenForChangesInPlayerState();
    _listenForChangesInPlayerPosition();
    _listenForChangesInBufferedPosition();
    _listenForChangesInTotalDuration();
    _listenForChangesInSequenceState();

    assetsLessonsNotifier.value = _assetsLessons;
  }

  // tag: lesson – AudioSource-д lesson объект холбож, дараа нь UI update-д ашиглана.
  Future<void> _setInitialPlaylist() async {
    // Эхний playlist хоосон байна, шаардлагатай үедээ lesson нэмнэ
    _playlist = ConcatenatingAudioSource(children: []);
    await _audioPlayer.setAudioSource(_playlist);
  }

  // <-- 3. Listeners – Player state, position, buffer, duration, sequence track update. -->

  void _listenForChangesInPlayerState() {
    // Audio-ийн state-ийг UI-тэй синхрончилно.
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
    // Одоогийн тоглосон хугацаа
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
    // Buffer
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
    // Total duration
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
        );
      }
    });
  }

  void _listenForChangesInSequenceState() {
    // Playlist-д тоглож буй дууг track хийж, Previous/Next button update.
    _audioPlayer.sequenceStateStream.listen((sequenceState) {
      final currentItem = sequenceState.currentSource;
      final lesson = currentItem?.tag as AudioLesson?;
      currentLessonNotifier.value = lesson;
      final playlist = sequenceState.effectiveSequence
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

  // <-- 4. Controls – Play/Pause, Next/Prev, Seek, Speed, Repeat, Download & Play. -->

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

  // Loop mode тохируулах
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

  // // 1x → 2x → 3x → 1x
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

  // Өмнөх 5 секунд рүү
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

  // Дараах 10 секунд рүү
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

  // downloadAndPlay дотор
  Future<void> downloadAndPlay(AudioLesson lesson) async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/${lesson.lessonNumber}.mp3');

      // Файл байхгүй бол assets-аас хуулна
      if (!await file.exists()) {
        final byteData = await rootBundle.load(lesson.audioPath);
        await file.writeAsBytes(byteData.buffer.asUint8List());
      }

      // SharedPreferences-д хадгалах
      await _saveDownloadedLesson(lesson, file.path);

      // Тоглуулах
      await _playLocalFile(file.path, lesson);
    } catch (e) {
      print('Download болон тоглуулахад алдаа гарлаа: $e');
    }
  }

  Future<void> _saveDownloadedLesson(
    AudioLesson lesson,
    String localPath,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final downloads = prefs.getStringList('downloads') ?? [];

    final newData = jsonEncode({
      "title": lesson.title,
      "lessonName": lesson.lessonName,
      "lessonNumber": lesson.lessonNumber,
      "startTime": lesson.startTime,
      "duration": lesson.duration.inSeconds,
      "audioPath": localPath,
      "lessonDescription": lesson.lessonDescription,
      "isLiked": lesson.isLiked,
      "image": lesson.image,
      "bgImage": lesson.bgImage,
      "remainingDays": lesson.remainingDays,
      "price": lesson.price,
    });

    // Давхардуулахгүй байхын тулд шалгана
    if (!downloads.any(
      (d) => jsonDecode(d)['lessonNumber'] == lesson.lessonNumber,
    )) {
      downloads.add(newData);
      await prefs.setStringList('downloads', downloads);

      // downloadedLessonsNotifier шинэчлэх
      await _loadDownloadedLessons();
    }
  }

  // Download хийсэн lesson устгах
  Future<void> _playLocalFile(String filePath, AudioLesson lesson) async {
    final updatedLesson = AudioLesson(
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
    );

    await _audioPlayer.stop();
    await _audioPlayer.setAudioSource(
      AudioSource.file(filePath, tag: updatedLesson),
    );
    currentLessonNotifier.value = updatedLesson;
    _audioPlayer.play();
  }

  Future<void> _loadDownloadedLessons() async {
    final prefs = await SharedPreferences.getInstance();
    final downloads = prefs.getStringList('downloads') ?? [];

    final downloadedLessons = downloads.map((d) {
      final json = jsonDecode(d);
      return AudioLesson(
        title: json['title'] ?? '',
        lessonName: json['lessonName'] ?? '',
        lessonNumber: json['lessonNumber'] ?? '',
        startTime: json['startTime'] ?? '',
        duration: Duration(seconds: json['duration'] ?? 0),
        audioPath: json['audioPath'] ?? '',
        lessonDescription: json['lessonDescription'] ?? '',
        isLiked: json['isLiked'] ?? false,
        image: json['image'] ?? 'assets/images/default.png', // default image
        bgImage: json['bgImage'] ?? 'assets/images/default_bg.png',
        remainingDays: json['remainingDays'] ?? '',
        price: json['price'] ?? 0,
      );
    }).toList();

    downloadedLessonsNotifier.value = downloadedLessons;
  }

  Future<void> deleteDownloadedLesson(AudioLesson lesson) async {
    try {
      final file = File(lesson.audioPath);
      if (await file.exists()) await file.delete();

      final prefs = await SharedPreferences.getInstance();
      final downloads = prefs.getStringList('downloads') ?? [];
      downloads.removeWhere(
        (d) => jsonDecode(d)['lessonNumber'] == lesson.lessonNumber,
      );
      await prefs.setStringList('downloads', downloads);

      // downloadedLessonsNotifier-ийг шинэчлэх
      await _loadDownloadedLessons();

      // Хэрэв одоо тоглож буй lesson устгагдсан бол зогсоох
      if (currentLessonNotifier.value?.lessonNumber == lesson.lessonNumber) {
        await _audioPlayer.stop();
        currentLessonNotifier.value = null;
      }
    } catch (e) {
      print('Файл устгахад алдаа гарлаа: $e');
    }
  }

  // Assets файлыг тоглуулах
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

  // Download хийгдсэн файлыг тоглуулах
  Future<void> playDownloadedLesson(AudioLesson lesson) async {
    try {
      await _playLocalFile(lesson.audioPath, lesson);
    } catch (e) {
      print('Download хийгдсэн файл тоглуулахад алдаа гарлаа: $e');
    }
  }

  // Lesson download хийгдсэн эсэхийг шалгах
  bool isLessonDownloaded(AudioLesson lesson) {
    return downloadedLessonsNotifier.value.any(
      (dl) => dl.lessonNumber == lesson.lessonNumber,
    );
  }
}
