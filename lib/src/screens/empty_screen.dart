import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../theme.dart/gradient_theme.dart';
import '../theme.dart/todo_colors_theme.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              alignment: Alignment.center,
              decoration:
                  const BoxDecoration(gradient: GradientThemeTodo.gradientblue),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 60, left: 18, right: 18, bottom: 19),
                child: Hearderavata(
                  numberTask: '',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 150),
              child: Column(
                children: [
                  const Image(image: AssetImage('assets/images/no_task.png')),
                  const SizedBox(height: 74),
                  Text(
                    tr('empty.bodyempty'),
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(color: TodoColorsTheme.nameApp),
                  ),
                  const SizedBox(height: 15),
                  Text(tr('empty.descriptionempty'),
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: TodoColorsTheme.descriptiononboarding,
                          fontFamily: 'osan'))
                ],
              ),
            )
          ],
        ),
      );
}

class Hearderavata extends StatelessWidget {
  String numberTask = '';
  Hearderavata({
    Key? key,
    required this.numberTask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                tr('empty.titleempty'),
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: TodoColorsTheme.primaryWhite),
              ),
              Text(
                  numberTask.isNotEmpty
                      ? 'Today you have $numberTask tasks'
                      : tr('empty.nameempty'),
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontFamily: 'osan', color: TodoColorsTheme.primaryWhite)),
            ],
          ),
          DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: const Image(
                    height: 40,
                    width: 40,
                    image: AssetImage('assets/images/girlxinh.png'),
                    fit: BoxFit.fill,
                  )))
        ],
      );
}
