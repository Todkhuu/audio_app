class FormatHelper {
  /// Хоног, цаг л тооцоолно
  static String formatDurationDaysHours(Duration d) {
    final days = d.inDays;
    final hours = d.inHours % 24;
    return '${days} хоног : ${hours} цаг';
  }

  /// Өдөр, цаг, минут, секунд
  static String formatDuration(Duration d) {
    final days = d.inDays;
    final hours = d.inHours % 24;
    final minutes = d.inMinutes % 60;
    final seconds = d.inSeconds % 60;
    return '${days} өдөр : ${hours} цаг : ${minutes} мин : ${seconds} сек';
  }

  /// 00:00:00 формат
  static String formatDurations(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours.remainder(12));
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$hours:$minutes:$seconds";
  }
}
