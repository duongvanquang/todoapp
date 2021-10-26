import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../theme.dart/todo_colors_theme.dart';

class ChooseDateText extends StatelessWidget {
  const ChooseDateText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(tr('addtask.namedate'),
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: TodoColorsTheme.greyAddTaskColor)),
          Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Text(tr('addtask.timeaddtask'),
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: TodoColorsTheme.greyAddTaskColor))),
              Expanded(
                flex: 3,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: const Icon(Icons.keyboard_arrow_down),
                    onPressed: () {},
                  ),
                ),
              )
            ],
          ),
        ],
      ));
}
