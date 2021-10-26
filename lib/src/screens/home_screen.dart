import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

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
  @override
  void initState() {
    _allTasks = NumberTask.allTasks;
    _checkDayOfTask();
    super.initState();
  }

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
                  Text(item.time,
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontFamily: 'osan',
                          color: TodoColorsTheme.secondaryGrey)),
                  const SizedBox(width: 13),
                  Text(
                    item.title,
                    style: item.isCheckedText
                        ? const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: TodoColorsTheme.primaryGrey,
                            fontFamily: 'osan',
                            fontSize: 14)
                        : Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: TodoColorsTheme.nameApp),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (item.isCheckedText == false) {
                          item.isActiveNotify = !item.isActiveNotify;
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
