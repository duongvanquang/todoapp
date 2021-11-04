import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:timezone/data/latest.dart' as tz;

import '../service/notification_api.dart';
import '../theme.dart/todo_colors_theme.dart';
import '../widgets/delete_numbertasks.dart';
import '../widgets/hearder_widgte.dart';
import 'model/number_task_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _taskToday = <NumberTask>[];
  final _taskTomorrow = <NumberTask>[];
  late final List<NumberTask> _allTasks;
  DateTime? _dayNotification;
  late NumberTask? _itemnumberTime;
  DateTime? _selectedNextDay;
  late DateTime? _currenDay;
  @override
  void initState() {
    tz.initializeTimeZones();
    _allTasks = NumberTask.allTasks;
    _checkDayOfTask();
    Stream.periodic(const Duration(seconds: 1), (_) => DateTime.now()).listen(
      (event) {
        for (final task in _todayActiveTaskList) {
          if (task.time!.year == DateTime.now().year &&
              task.time!.month == DateTime.now().month &&
              task.time!.day == DateTime.now().day &&
              task.time!.hour == DateTime.now().hour &&
              task.time!.minute == DateTime.now().minute &&
              task.time!.second == DateTime.now().second) {
            scheduleAlarm(_itemnumberTime!);
          }
        }
        if (_dayNotification != null) {
          final dayTimenow = DateTime(
              event.year, event.month, event.day, event.hour, event.minute);
          if (dayTimenow.isAtSameMomentAs(_dayNotification!)) {
            scheduleAlarm(_itemnumberTime!);
          }
        }
      },
    );
    super.initState();
  }

  List<NumberTask> get _todayActiveTaskList => _allTasks
      .where((task) =>
          task.time!.day == DateTime.now().day &&
          task.isActiveNotify &&
          !task.isCheckedText)
      .toList();
  void _checkDayOfTask() {
    for (var i = 0; i < _allTasks.length; i++) {
      if (_allTasks[i].dayOfTask == 'today') {
        _taskToday.add(_allTasks[i]);
      } else {
        _taskTomorrow.add(_allTasks[i]);
      }
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
          body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const HearderWidget(),
          const SizedBox(height: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (_taskToday.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(
                    left: 18,
                    top: 15,
                  ),
                  child: Text(
                    tr('homescreen.titletoday'),
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: TodoColorsTheme.nameApp),
                  ),
                ),
              _buildTaskListView(_taskToday),
              if (_taskTomorrow.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(
                    left: 18,
                    top: 27,
                  ),
                  child: Text(
                    tr('homescreen.titletomorrow'),
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: TodoColorsTheme.nameApp),
                  ),
                ),
              _buildTaskListView(_taskTomorrow),
            ],
          )
        ]),
      ));

  ListView _buildTaskListView(List<NumberTask> itemNumber) => ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(18),
      physics: const ScrollPhysics(),
      itemCount: itemNumber.length,
      itemBuilder: (context, index) => Dismissible(
            direction: DismissDirection.endToStart,
            background: const CustomDeleteTaskIcon(),
            key: Key(itemNumber[index].title),
            onDismissed: (direction) {
              setState(() {
                itemNumber.removeAt(index);
                if (_taskToday.isEmpty && _taskTomorrow.isEmpty) {
                  Navigator.of(context).pushNamed('/empty');
                }
              });
            },
            child: _buildItemOfTasks(itemNumber, index, context),
          ));
  Padding _buildItemOfTasks(
      List<NumberTask> itemNumber, int index, BuildContext context) {
    final item = itemNumber[index];
    return Padding(
        padding: const EdgeInsets.only(bottom: 13),
        child: Card(
            elevation: 7,
            color: TodoColorsTheme.primaryWhite,
            child: Container(
              padding: const EdgeInsets.only(right: 10),
              child: Row(
                children: [
                  Container(
                      width: 4,
                      height: 56,
                      decoration: BoxDecoration(
                          color: item.color,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4),
                              bottomLeft: Radius.circular(4)))),
                  const SizedBox(width: 11),
                  Checkbox(
                    value: item.isCheckedText,
                    shape: const CircleBorder(),
                    activeColor: TodoColorsTheme.greenColor,
                    onChanged: (value) {
                      setState(() {
                        item.isCheckedText = !item.isCheckedText;
                        item.isActiveNotify = false;
                      });
                    },
                  ),
                  const SizedBox(width: 10),
                  Text(DateFormat('hh:mm a').format(item.time!),
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontFamily: 'osan',
                          color: TodoColorsTheme.secondaryGrey)),
                  const SizedBox(width: 13),
                  Expanded(
                    child: Text(
                      item.title,
                      style: item.isCheckedText
                          ? const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              decoration: TextDecoration.lineThrough,
                              color: TodoColorsTheme.primaryGrey,
                              fontFamily: 'osan',
                              fontSize: 14)
                          : Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: TodoColorsTheme.nameApp),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _currenDay = DateTime(
                            DateTime.now().year,
                            DateTime.now().month,
                            DateTime.now().day,
                            DateTime.now().hour,
                            DateTime.now().minute);
                        _selectedNextDay = DateTime(
                            item.time!.year,
                            item.time!.month,
                            item.time!.day,
                            item.time!.hour,
                            item.time!.minute);
                        _dayNotification = _selectedNextDay;
                        _itemnumberTime = item;
                        if (item.isCheckedText == false) {
                          item.isActiveNotify = !item.isActiveNotify;
                          if (item.isActiveNotify &&
                              _selectedNextDay!.isAtSameMomentAs(_currenDay!)) {
                            scheduleAlarm(_itemnumberTime!);
                          }
                        }
                      });
                    },
                    icon: Icon(Icons.notifications,
                        color:
                            item.isActiveNotify ? Colors.amber : Colors.grey),
                  ),
                ],
              ),
            )));
  }
}
