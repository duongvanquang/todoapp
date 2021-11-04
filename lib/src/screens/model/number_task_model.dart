import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class NumberTask {
  final String title;
  final DateTime? time;
  final Color color;
  int id;
  final String dayOfTask;
  bool isCheckedText;
  bool isActiveNotify;
  NumberTask(
      {required this.dayOfTask,
      required this.color,
      required this.id,
      required this.isCheckedText,
      required this.isActiveNotify,
      required this.title,
      required this.time});

  static List<NumberTask> allTasks = [
    NumberTask(
        id: 1,
        color: const Color(0xFFFFD506),
        isCheckedText: true,
        isActiveNotify: false,
        title: tr('homescreen.namego'),
        dayOfTask: 'today',
        time: DateTime(2021, 11, 4, 14, 10)),
    NumberTask(
        id: 2,
        title: tr('homescreen.namesend'),
        dayOfTask: 'today',
        color: const Color(0xFF1ED102),
        isCheckedText: false,
        isActiveNotify: false,
        time: DateTime(2021, 11, 4, 16, 48)),
    NumberTask(
        id: 3,
        color: const Color(0xFFD10263),
        dayOfTask: 'today',
        isCheckedText: false,
        isActiveNotify: false,
        title: tr('homescreen.namemeet'),
        time: DateTime(2021, 11, 4, 14, 46)),
    NumberTask(
        id: 4,
        dayOfTask: 'today',
        color: const Color(0xFF1ED102),
        isCheckedText: false,
        isActiveNotify: false,
        title: tr('homescreen.nameemail'),
        time: DateTime(2021, 11, 4, 14, 47)),
    NumberTask(
        id: 5,
        dayOfTask: 'tomorrow',
        color: const Color(0xFFFFD506),
        isCheckedText: false,
        isActiveNotify: false,
        title: tr('homescreen.nameyoga'),
        time: DateTime(2021, 11, 5, 1)),
    NumberTask(
        id: 6,
        title: tr('homescreen.namesend'),
        dayOfTask: 'tomorrow',
        color: const Color(0xFF1ED102),
        isCheckedText: false,
        isActiveNotify: false,
        time: DateTime(2021, 11, 4, 11, 50)),
    NumberTask(
        id: 7,
        dayOfTask: 'tomorrow',
        color: const Color(0xFF1ED102),
        isCheckedText: false,
        isActiveNotify: false,
        title: tr('homescreen.nameemail'),
        time: DateTime(2021, 11, 4, 13)),
    NumberTask(
        id: 8,
        color: const Color(0xFFD10263),
        dayOfTask: 'tomorrow',
        isCheckedText: false,
        isActiveNotify: false,
        title: tr('homescreen.namemeet'),
        time: DateTime(2021, 11, 4, 15)),
    NumberTask(
        id: 9,
        dayOfTask: 'tomorrow',
        color: const Color(0xFF1ED102),
        isCheckedText: false,
        isActiveNotify: false,
        title: tr('homescreen.nameemail'),
        time: DateTime(2021, 11, 4, 16))
  ];
}
