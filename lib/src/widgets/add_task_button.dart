import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../theme.dart/gradient_theme.dart';
import '../theme.dart/todo_colors_theme.dart';

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(left: 13, right: 26),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: GradientThemeTodo.gradientColorAddTask,
            boxShadow: [
              BoxShadow(
                  color: TodoColorsTheme.blueColor.withOpacity(1),
                  blurRadius: 6,
                  offset: const Offset(0, 3)),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 19, bottom: 19),
            child: Text(
              tr('addtask.nameaddtask'),
              style: Theme.of(context).textTheme.headline4!.copyWith(
                  fontFamily: 'osan', color: TodoColorsTheme.backgroundGrey),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
}
