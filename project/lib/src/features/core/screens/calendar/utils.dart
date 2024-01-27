import 'dart:collection';

import 'package:get/get.dart';
import 'package:project/src/features/core/controllers/skin_detect_controller.dart';
import 'package:table_calendar/table_calendar.dart';

//i want modify this base on skinDetectController

final skinDetectController = Get.find<SkinDetectController>();

final today = DateTime.now();
final startOfDay = DateTime(today.year, today.month, today.day);

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
    (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);
