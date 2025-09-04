class AudioLesson {
  final String title;
  final String lessonName;
  final String lessonNumber;
  final String startTime;
  final Duration duration;
  final String audioPath;
  final String lessonDescription;
  bool isLiked;
  final String image;
  final String bgImage;
  final int price;
  final String remainingDays;

  AudioLesson({
    required this.title,
    required this.lessonName,
    required this.lessonNumber,
    required this.startTime,
    required this.duration,
    required this.audioPath,
    required this.lessonDescription,
    this.isLiked = false,
    required this.image,
    required this.bgImage,
    required this.price,
    required this.remainingDays,
  });
}
