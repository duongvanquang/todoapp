import 'package:flutter/material.dart';
import '../theme.dart/todo_colors_theme.dart';

class CustomDeleteTaskIcon extends StatelessWidget {
  const CustomDeleteTaskIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                  color: TodoColorsTheme.lightredColor,
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              child: const Icon(Icons.delete_outlined, color: Colors.redAccent),
            ),
          )
        ],
      );
}
