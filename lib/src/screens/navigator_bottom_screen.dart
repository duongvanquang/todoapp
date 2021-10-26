import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../theme.dart/todo_colors_theme.dart';
import 'add_task_screen.dart';
import 'home_screen.dart';
import 'task_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  var _currentTab = 0;
  final List<Widget> screens = [
    const HomeScreen(),
    const TaskScreen(),
  ];
  final PageStorageBucket _bucket = PageStorageBucket();
  Widget _currentScreen = const HomeScreen();

  void _addTaskModelBottomSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => const AddTaskNumber(),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: PageStorage(bucket: _bucket, child: _currentScreen),
        floatingActionButton: FloatingActionButton(
          onPressed: _addTaskModelBottomSheet,
          backgroundColor: TodoColorsTheme.pinkColor.withOpacity(1),
          elevation: 0,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(100),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: TodoColorsTheme.pinkColor.withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 2,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
              ),
              const Image(image: AssetImage('assets/images/add_button.png'))
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          notchMargin: 10,
          child: SizedBox(
            height: 60,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        _currentScreen = const HomeScreen();
                        _currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image:
                              const AssetImage('assets/images/icon_home.png'),
                          width: 23,
                          height: 25,
                          color: _currentTab == 0
                              ? TodoColorsTheme.blueColor
                              : TodoColorsTheme.primaryGrey,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 7),
                          child: Text(
                            tr('bottomNavigator.homeButon'),
                            style:
                                Theme.of(context).textTheme.bodyText2?.copyWith(
                                      color: _currentTab == 0
                                          ? TodoColorsTheme.blueColor
                                          : TodoColorsTheme.primaryGrey,
                                    ),
                          ),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        _currentScreen = const TaskScreen();
                        _currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image:
                              const AssetImage('assets/images/icon_task.png'),
                          width: 23,
                          height: 25,
                          color: _currentTab == 1
                              ? TodoColorsTheme.blueColor
                              : TodoColorsTheme.primaryGrey,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 7),
                          child: Text(
                            tr('bottomNavigator.taskButon'),
                            style:
                                Theme.of(context).textTheme.bodyText2?.copyWith(
                                      color: _currentTab == 1
                                          ? TodoColorsTheme.blueColor
                                          : TodoColorsTheme.primaryGrey,
                                    ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
