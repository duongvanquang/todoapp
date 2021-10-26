import 'package:flutter/material.dart';
import '../theme.dart/todo_colors_theme.dart';

class CloseBottomSheetButton extends StatelessWidget {
  const CloseBottomSheetButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Positioned.fill(
      child: Align(
          alignment: Alignment.topCenter,
          child: InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: 58,
              height: 58,
              decoration: BoxDecoration(
                color: TodoColorsTheme.pinkColor,
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                boxShadow: [
                  BoxShadow(
                    color: TodoColorsTheme.pinkColor.withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 2,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const Icon(
                Icons.close,
                color: Colors.white,
                size: 40,
              ),
            ),
          )));
}
