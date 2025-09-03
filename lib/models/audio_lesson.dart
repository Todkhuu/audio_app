class AudioLesson {
  final String title;
  final String lessonNumber;
  final String startTime;
  final Duration duration;
  final String audioPath;
  final String lessonDescription;
  bool isLiked;

  AudioLesson({
    required this.title,
    required this.lessonNumber,
    required this.startTime,
    required this.duration,
    required this.audioPath,
    required this.lessonDescription,
    this.isLiked = false,
  });
}
