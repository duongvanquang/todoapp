import 'package:flutter/material.dart';

class Section {
  final String image;
  final String title;
  final int task;
  final Color color;
  bool isCheckColor;
  Section(
      {required this.image,
      required this.color,
      required this.title,
      required this.isCheckColor,
      required this.task});
}

List<Section> genreSection = [
  Section(
      image: 'assets/images/personal.png',
      title: 'Personal',
      isCheckColor: false,
      color: const Color(0xFFFFD506),
      task: 12),
  Section(
      image: 'assets/images/work.png',
      title: 'Work',
      isCheckColor: true,
      color: const Color(0xFF1ED102),
      task: 44),
  Section(
      image: 'assets/images/meeting.png',
      title: 'Meeting',
      isCheckColor: false,
      color: const Color(0xFFD10263),
      task: 45),
  Section(
      image: 'assets/images/shopping.png',
      title: 'Shopping',
      color: const Color(0xFFF29130),
      isCheckColor: false,
      task: 54),
  Section(
      image: 'assets/images/personal.png',
      title: 'Travel',
      color: const Color(0xFF3044F2),
      isCheckColor: false,
      task: 72),
  Section(
      image: 'assets/images/work.png',
      title: 'Swim',
      color: const Color(0xFF5F79F4),
      isCheckColor: false,
      task: 84),
];
