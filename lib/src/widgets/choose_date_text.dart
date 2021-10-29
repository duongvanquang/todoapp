import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../theme.dart/todo_colors_theme.dart';

class ChooseDateText extends StatefulWidget {
  const ChooseDateText({
    Key? key,
  }) : super(key: key);

  @override
  State<ChooseDateText> createState() => _ChooseDateTextState();
}

class _ChooseDateTextState extends State<ChooseDateText> {
  DateTime selectedDate = DateTime.now();
  _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  bool _isPress = false;
  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(tr('addtask.namedate'),
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: TodoColorsTheme.greyAddTaskColor)),
              Visibility(
                visible: !_isPress,
                child: Expanded(
                  flex: 3,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: const Icon(Icons.keyboard_arrow_down),
                      onPressed: () {
                        setState(() {
                          _isPress = !_isPress;
                        });
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
          Visibility(
            visible: _isPress,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    '${selectedDate.toLocal()}'.split(' ')[0],
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: TodoColorsTheme.greyAddTaskColor),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                        icon: const Icon(Icons.keyboard_arrow_down),
                        onPressed: () {
                          _selectDate(context);
                        }),
                  ),
                ),
              ],
            ),
          ),
        ],
      ));
}
