import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
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
  DateTime _selectedDate = DateTime.now();
  _selectDate(BuildContext context) async {
    await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    ).then((valueDate) async {
      if (valueDate != null) {
        await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        ).then((valueTime) {
          if (valueTime != null) {
            _selectedDate = DateTime(
              valueDate.year,
              valueDate.month,
              valueDate.day,
              valueTime.hour,
              valueTime.minute,
            );
            setState(() {
              _selectedNextDay = DateTime(
                  _selectedDate.year, _selectedDate.month, _selectedDate.day);
              _currenDay = DateTime(DateTime.now().year, DateTime.now().month,
                  DateTime.now().day);
              if (_selectedNextDay!.isAtSameMomentAs(_currenDay!)) {
                _selectedDay = 'today: ${valueTime.hour}: ${valueTime.minute}';
              } else if (_currenDay!.isAtSameMomentAs(
                  _selectedNextDay!.subtract(const Duration(days: 1)))) {
                _selectedDay =
                    'tomorow: ${valueTime.hour}: ${valueTime.minute}';
              } else {
                _selectedDay =
                    '${valueDate.day} /${valueDate.month} /${valueDate.year} : ${valueTime.hour}: ${valueTime.minute}';
              }
            });
          }
        });
      }
    });
    // }
  }

  bool _isPress = false;
  String _selectedDay = '';
  DateTime? _selectedNextDay;
  DateTime? _currenDay;
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
                    _selectedDay,
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
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty<DateTime?>('_selectedNextDay', _selectedNextDay));
    DiagnosticsProperty<DateTime?>('_currenDay', _currenDay);
  }
}
