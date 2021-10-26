import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class NumberTask {
  final String title;
  final String time;
  final Color color;
  final String dayOfTask;
  bool isCheckedText;
  bool isActiveNotify;
  NumberTask(
      {required this.dayOfTask,
      required this.color,
      required this.isCheckedText,
      required this.isActiveNotify,
      required this.title,
      required this.time});

  static List<NumberTask> allTasks = [
    NumberTask(
        color: const Color(0xFFFFD506),
        isCheckedText: true,
        isActiveNotify: false,
        title: tr('homescreen.namego'),
        dayOfTask: 'today',
        time: '07:00 AM'),
    NumberTask(
        title: tr('homescreen.namesend'),
        dayOfTask: 'today',
        color: const Color(0xFF1ED102),
        isCheckedText: false,
        isActiveNotify: false,
        time: '08:00 AM'),
    NumberTask(
        color: const Color(0xFFD10263),
        dayOfTask: 'today',
        isCheckedText: false,
        isActiveNotify: true,
        title: tr('homescreen.namemeet'),
        time: '10:00 AM'),
    NumberTask(
        dayOfTask: 'today',
        color: const Color(0xFF1ED102),
        isCheckedText: false,
        isActiveNotify: false,
        title: tr('homescreen.nameemail'),
        time: '13:00 PM'),
    NumberTask(
        dayOfTask: 'tomorrow',
        color: const Color(0xFFFFD506),
        isCheckedText: false,
        isActiveNotify: false,
        title: tr('homescreen.nameyoga'),
        time: '07.00 AM'),
    NumberTask(
        title: tr('homescreen.namesend'),
        dayOfTask: 'tomorrow',
        color: const Color(0xFF1ED102),
        isCheckedText: false,
        isActiveNotify: false,
        time: '08:00 AM'),
    NumberTask(
        dayOfTask: 'tomorrow',
        color: const Color(0xFF1ED102),
        isCheckedText: false,
        isActiveNotify: false,
        title: tr('homescreen.nameemail'),
        time: '13:00 PM'),
    NumberTask(
        color: const Color(0xFFD10263),
        dayOfTask: 'tomorrow',
        isCheckedText: false,
        isActiveNotify: true,
        title: tr('homescreen.namemeet'),
        time: '15:00 PM'),
    NumberTask(
        dayOfTask: 'tomorrow',
        color: const Color(0xFF1ED102),
        isCheckedText: false,
        isActiveNotify: false,
        title: tr('homescreen.nameemail'),
        time: '16.00 PM')
  ];
}
