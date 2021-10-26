import 'package:flutter/material.dart';
import '../theme.dart/todo_colors_theme.dart';

class CustomTextFieldAddNewTask extends StatelessWidget {
  const CustomTextFieldAddNewTask({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextField(
          style: Theme.of(context)
              .textTheme
              .headline3!
              .copyWith(color: TodoColorsTheme.primaryGrey),
          cursorColor: Colors.black,
          keyboardType: TextInputType.emailAddress,
          autofocus: true,
          decoration: const InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              disabledBorder: InputBorder.none),
        ),
      );
}
