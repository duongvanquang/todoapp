import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../theme.dart/gradient_theme.dart';
import '../theme.dart/todo_colors_theme.dart';

class OnboadingScreen extends StatelessWidget {
  const OnboadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 182),
          child: Column(
            children: [
              const Image(image: AssetImage('assets/images/logo_started.png')),
              const SizedBox(
                height: 129,
              ),
              Text(
                tr('onboarding.titleonboarding'),
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(color: TodoColorsTheme.nameApp),
              ),
              const SizedBox(
                height: 6,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 58, right: 58),
                child: Text(tr('onboarding.nameonbroading'),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontFamily: 'osan',
                        color: TodoColorsTheme.descriptiononboarding)),
              ),
              const SizedBox(height: 70),
              InkWell(
                onTap: () =>
                    Navigator.of(context).pushNamed('/navigatorbottom'),
                child: Container(
                  alignment: Alignment.center,
                  height: 57,
                  width: 258,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: GradientThemeTodo.greenGadient,
                    boxShadow: [
                      BoxShadow(
                          color: TodoColorsTheme.greenColor.withOpacity(1),
                          blurRadius: 6,
                          offset: const Offset(0, 3)),
                    ],
                  ),
                  child: Text(
                    tr('onboarding.buttononboarding'),
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontFamily: 'osan',
                        color: TodoColorsTheme.backgroundGrey),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
      );
}
