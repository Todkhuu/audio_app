class AudioLesson {
  final String id;
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
  final String category;
  final DateTime? endTime;
  final double? rate;

  AudioLesson({
    required this.id,
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
    required this.category,
    this.endTime,
    this.rate,
  });

  /// Map → Object
  factory AudioLesson.fromJson(Map<String, dynamic> json) {
    return AudioLesson(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      lessonName: json['lessonName'] ?? '',
      lessonNumber: json['lessonNumber'] ?? '',
      startTime: json['startTime'] ?? '',
      duration: Duration(seconds: json['duration'] ?? 0),
      audioPath: json['audioPath'] ?? '',
      lessonDescription: json['lessonDescription'] ?? '',
      isLiked: json['isLiked'] ?? false,
      image: json['image'] ?? 'assets/images/default.png',
      bgImage: json['bgImage'] ?? 'assets/images/default_bg.png',
      remainingDays: json['remainingDays'] ?? '',
      price: json['price'] ?? 0,
      category: json['category'] ?? '',
    );
  }

  /// Object → Map
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "lessonName": lessonName,
      "lessonNumber": lessonNumber,
      "startTime": startTime,
      "duration": duration.inSeconds,
      "audioPath": audioPath,
      "lessonDescription": lessonDescription,
      "isLiked": isLiked,
      "image": image,
      "bgImage": bgImage,
      "remainingDays": remainingDays,
      "price": price,
      "category": category,
    };
  }
}
