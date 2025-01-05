class DateFormatter {
  DateFormatter._();

  static String getTimeLeft(DateTime targetDateTime) {
    DateTime now = DateTime.now();

    Duration difference = targetDateTime.difference(now);

    int hours = difference.inHours;
    int minutes = difference.inMinutes % 60;

    return '${hours.toString().padLeft(2, '0')}h ${minutes.toString().padLeft(2, '0')}m';
  }
}
