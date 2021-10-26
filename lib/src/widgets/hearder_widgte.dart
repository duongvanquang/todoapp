import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../screens/empty_screen.dart';
import '../theme.dart/gradient_theme.dart';
import '../theme.dart/todo_colors_theme.dart';

class HearderWidget extends StatelessWidget {
  const HearderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        decoration:
            const BoxDecoration(gradient: GradientThemeTodo.gradientblue),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 60, left: 18, right: 18),
            child: Hearderavata(numberTask: '9'),
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.only(left: 18, right: 18, bottom: 13),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: TodoColorsTheme.primaryWhite.withOpacity(0.34),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 25, left: 16, right: 36, bottom: 17),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tr('task.heardertitle'),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3!
                                  .copyWith(
                                      color: TodoColorsTheme.primaryWhite),
                            ),
                            const SizedBox(height: 7),
                            Text(tr('task.heardertitlecline'),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        fontFamily: 'osan',
                                        color: TodoColorsTheme.primaryWhite)),
                            const SizedBox(height: 8),
                            Text(tr('task.heardertime'),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        fontFamily: 'osan',
                                        color: TodoColorsTheme.primaryWhite))
                          ],
                        ),
                        const Image(
                          image: AssetImage('assets/images/bell.png'),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.close, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ]),
      );
}
