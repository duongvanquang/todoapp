import 'package:flutter/material.dart';

class GradientThemeTodo {
  static const greenGadient = LinearGradient(
      colors: [
        Color(0xFF599939),
        Color(0xFF53f005),
      ],
      end: Alignment.topLeft,
      begin: Alignment.bottomRight,
      stops: [0.0, 1.0]);
  static const greenPink = LinearGradient(
      colors: [
        Color(0xFFa3317e),
        Color(0xFFf20aa6),
      ],
      end: Alignment.topLeft,
      begin: Alignment.bottomRight,
      stops: [0.0, 1.0]);
  static const gradientblue = LinearGradient(
      colors: [
        Color(0xFF5abae0),
        Color(0xFF0eb0f0),
      ],
      end: Alignment.topLeft,
      begin: Alignment.bottomRight,
      stops: [0.0, 1.0]);
  static const gradientColorAddTask = LinearGradient(
      colors: [Color(0xFF80b2f2), Color(0xFF71abf5)],
      end: Alignment.topLeft,
      begin: Alignment.bottomRight,
      stops: [0.0, 1.0]);
}
