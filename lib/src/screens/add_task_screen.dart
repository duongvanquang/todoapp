import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../theme.dart/todo_colors_theme.dart';
import '../widgets/add_task_button.dart';
import '../widgets/choose_date_text.dart';
import '../widgets/close_bottom_sheet_button.dart';
import '../widgets/custom_text_field_add_new_task.dart';
import '../widgets/list_add_task.dart';
import 'model/section_task_model.dart';

class AddTaskNumber extends StatefulWidget {
  const AddTaskNumber({Key? key}) : super(key: key);

  @override
  _AddTaskNumberState createState() => _AddTaskNumberState();
}

class _AddTaskNumberState extends State<AddTaskNumber> {
  late List<Section> _listNumber;
  @override
  void initState() {
    _listNumber = genreSection;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Container(
        alignment: Alignment.bottomCenter,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.2,
              child: Card(
                  margin: const EdgeInsets.only(top: 25),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.elliptical(150, 30),
                          topRight: Radius.elliptical(150, 30))),
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 4, right: 5, bottom: 16, top: 48),
                          child: Text(
                            tr('addtask.titleadd'),
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(color: TodoColorsTheme.primaryGrey),
                          )),
                      const CustomTextFieldAddNewTask(),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(thickness: 2),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ListProject(
                          listAddTask: _listNumber,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(thickness: 2),
                      ),
                      const SizedBox(height: 40),
                      const ChooseDateText(),
                      const SizedBox(height: 21),
                      const AddTaskButton()
                    ],
                  )),
            ),
            const CloseBottomSheetButton()
          ],
        ),
      );
}
