import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'screens/add_task_screen.dart';
import 'screens/empty_screen.dart';
import 'screens/navigator_bottom_screen.dart';
import 'screens/onboading_screen.dart';
import 'theme.dart/todo_theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: TodoTheme.buildTheme(),
        routes: {
          '/': (context) => const OnboadingScreen(),
          '/navigatorbottom': (context) => const BottomNavigation(),
          '/detail': (context) => const AddTaskNumber(),
          '/empty': (context) => const EmptyScreen(),
        },
      );
}
