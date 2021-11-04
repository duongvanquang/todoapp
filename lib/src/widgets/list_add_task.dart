import 'package:flutter/material.dart';

import '../screens/model/section_task_model.dart';
import '../theme.dart/todo_colors_theme.dart';

class ListProject extends StatefulWidget {
  final List<Section>? listAddTask;
  const ListProject({
    Key? key,
    this.listAddTask,
  }) : super(key: key);

  @override
  State<ListProject> createState() => _ListProjectState();
}

class _ListProjectState extends State<ListProject> {
  int? _selectedIndex;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(left: 7),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 56),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: widget.listAddTask!.length,
            itemBuilder: (context, index) {
              final addItem = widget.listAddTask![index];
              return Row(children: [
                const SizedBox(width: 4),
                Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      style: ButtonStyle(
                          backgroundColor: index == _selectedIndex
                              ? MaterialStateProperty.all(addItem.color)
                              : null,
                          elevation: index == _selectedIndex
                              ? MaterialStateProperty.all(2)
                              : null,
                          shadowColor: index == _selectedIndex
                              ? MaterialStateProperty.all(addItem.color)
                              : null),
                      child: Row(children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: addItem.color,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          addItem.title,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: TodoColorsTheme.secondaryGrey),
                        ),
                      ]),
                    )),
              ]);
            },
          ),
        ),
      );
}
