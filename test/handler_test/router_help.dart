import 'package:flutter/material.dart';
import 'package:todoapp/src/screens/onboading_screen.dart';

const String onboardingRoute = '/';
const String bottomNavigation = '/navigatorbottom';
const String addTaskNumber = '/detail';
const String emptyScreen = '/empty';

mixin Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onboardingRoute:
        return MaterialPageRoute(
          builder: (_) => const OnboadingScreen(),
        );
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
