import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/audio_lesson.dart';

class DownloadManager {
  static const _storageKey = "downloads";

  // Татах
  static Future<String> downloadLesson(AudioLesson lesson) async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/${lesson.lessonNumber}.mp3');

    if (!await file.exists()) {
      if (lesson.audioPath.startsWith("http")) {
        await Dio().download(lesson.audioPath, file.path);
      } else if (lesson.audioPath.startsWith("assets")) {
        final byteData = await rootBundle.load(lesson.audioPath);
        await file.writeAsBytes(byteData.buffer.asUint8List());
      } else {
        throw Exception("Алдаатай audioPath: ${lesson.audioPath}");
      }
    }
    return file.path;
  }

  // Хадгалах
  static Future<void> saveLesson(AudioLesson lesson, String localPath) async {
    final prefs = await SharedPreferences.getInstance();
    final downloads = prefs.getStringList(_storageKey) ?? [];

    final newData = jsonEncode({
      "id": lesson.id,
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
      "category": lesson.category,
    });

    // Давхардахгүй бол хадгална
    if (!downloads.any(
      (d) => jsonDecode(d)['lessonNumber'] == lesson.lessonNumber,
    )) {
      downloads.add(newData);
      await prefs.setStringList(_storageKey, downloads);
    }
  }

  // Татсан жагсаалт дуудах
  static Future<List<AudioLesson>> loadDownloadedLessons() async {
    final prefs = await SharedPreferences.getInstance();
    final downloads = prefs.getStringList(_storageKey) ?? [];

    return downloads.map((d) {
      final json = jsonDecode(d);
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
    }).toList();
  }

  // Устгах
  static Future<void> deleteLesson(AudioLesson lesson) async {
    try {
      final file = File(lesson.audioPath);
      if (await file.exists()) await file.delete();

      final prefs = await SharedPreferences.getInstance();
      final downloads = prefs.getStringList(_storageKey) ?? [];
      downloads.removeWhere(
        (d) => jsonDecode(d)['lessonNumber'] == lesson.lessonNumber,
      );
      await prefs.setStringList(_storageKey, downloads);
    } catch (e) {
      print("Файл устгахад алдаа: $e");
    }
  }

  // Татсан эсэх шалгах
  static Future<bool> isDownloaded(AudioLesson lesson) async {
    final prefs = await SharedPreferences.getInstance();
    final downloads = prefs.getStringList(_storageKey) ?? [];
    return downloads.any(
      (d) => jsonDecode(d)['lessonNumber'] == lesson.lessonNumber,
    );
  }
}
