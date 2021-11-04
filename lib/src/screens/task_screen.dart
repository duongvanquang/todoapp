import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../theme.dart/todo_colors_theme.dart';
import '../widgets/hearder_widgte.dart';
import 'model/section_task_model.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
          body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HearderWidget(),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tr('task.nameproject'),
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: TodoColorsTheme.nameApp),
                    ),
                    const SizedBox(height: 16),
                    GridView.builder(
                        shrinkWrap: true,
                        itemCount: genreSection.length,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 19,
                                childAspectRatio: 0.92,
                                mainAxisSpacing: 23),
                        itemBuilder: (context, index) => Card(
                            elevation: 7,
                            color: TodoColorsTheme.primaryWhite,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 31, bottom: 31),
                              child: Column(
                                children: [
                                  Image(
                                      image: AssetImage(
                                          genreSection[index].image)),
                                  const SizedBox(height: 9),
                                  Text(genreSection[index].title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4!
                                          .copyWith(
                                              color: TodoColorsTheme.nameTask)),
                                  const SizedBox(height: 14),
                                  Text(
                                    '${genreSection[index].task} task',
                                    style: Theme.of(context)
                                        .textTheme
                                        .button!
                                        .copyWith(
                                            color:
                                                TodoColorsTheme.secondaryGrey),
                                  )
                                ],
                              ),
                            )))
                  ],
                ),
              )
            ],
          ),
        ),
      ));
}
