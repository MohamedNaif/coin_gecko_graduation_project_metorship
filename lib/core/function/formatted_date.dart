import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';

DateTime? dateTimeFromMillis(int? millis) {
  if (millis == null) return null;
  return DateTime.fromMillisecondsSinceEpoch(millis);
}

// from date time to millis
int? dateTimeToMillis(DateTime? dateTime) {
  if (dateTime == null) return null;
  return dateTime.millisecondsSinceEpoch;
}

String formattedDate(DateTime? dateTime) {
  if (dateTime == null) return 'N/A';
  return DateFormat('yyyy-MM-dd', 'en').format(dateTime);
}

String formattedTime(String? dateTime) {
  if (dateTime == null || dateTime.isEmpty) return 'N/A';

  try {
    log(dateTime);
    // Split into components
    String timePart = dateTime.split(' ')[0]; // "3:00:00"
    String amPmPart = dateTime.split(' ')[1]; // "PM"

    // Split time into hours, minutes, seconds
    List<String> timeComponents = timePart.split(':');
    int hours = int.parse(timeComponents[0]);
    int minutes = int.parse(timeComponents[1]);
    int seconds = int.parse(timeComponents[2]);

    // Adjust hours for PM
    if (amPmPart == 'PM' && hours != 12) {
      hours += 12;
    }
    // Adjust for 12 AM
    if (amPmPart == 'AM' && hours == 12) {
      hours = 0;
    }

    // Create DateTime object
    DateTime now = DateTime.now();
    DateTime parsedTime = DateTime(
      now.year,
      now.month,
      now.day,
      hours,
      minutes,
      seconds,
    );

    // Format output as desired
    return DateFormat('hh:mm a').format(parsedTime);
  } catch (e) {
    log(e.toString());
    return 'Invalid time';
  }
}

String formatDate(String date) {
  return DateFormat('d MMMM yyyy', 'ar').format(DateTime.parse(date).toLocal());
}

String formatTime(String date) {
  return DateFormat('hh:mm a', 'ar').format(DateTime.parse(date).toLocal());
}

String formatFullWithTimeDate(String date) {
  return DateFormat(' hh:mm a - d MMMM yyyy', 'ar')
      .format(DateTime.parse(date).toLocal());
}

String timeAgo(String date) {
  final now = DateTime.now();
  final difference = now.difference(DateTime.parse(date).toLocal());

  if (difference.inSeconds < 60) {
    return 'منذ ${difference.inSeconds} ثانية';
  } else if (difference.inMinutes < 60) {
    return 'منذ ${difference.inMinutes} دقيقة';
  } else if (difference.inHours < 24) {
    return 'منذ ${difference.inHours} ساعة';
  } else if (difference.inDays < 7) {
    return 'منذ ${difference.inDays} يوم';
  } else if (difference.inDays < 30) {
    int weeks = (difference.inDays / 7).floor();
    return 'منذ $weeks ${weeks == 1 ? 'أسبوع' : 'أسابيع'}';
  } else if (difference.inDays < 365) {
    int months = (difference.inDays / 30).floor();
    return 'منذ $months ${months == 1 ? 'شهر' : 'شهور'}';
  } else {
    return formatDate(date);
  }
  
}
String getArabicDayName(String? day) {
  if (day == null) return '';
  // Parse the string to DateTime (adjust the format if needed)
  final date = DateTime.tryParse(day);
  if (date == null) return '';
  // Set the locale to Arabic and get the day name
  return DateFormat.EEEE('ar').format(date);
}