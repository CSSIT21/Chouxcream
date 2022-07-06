import 'package:chouxcream_app/classes/theme.dart';
import 'package:chouxcream_app/models/menu/progress.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Nutrition extends StatelessWidget {
  final Progress progress;

  const Nutrition({Key? key, required this.progress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...pair("Calories", progress.intakeCalorie, progress.maxCalorie, ThemeConstant.colorPrimary),
        ...pair("Protein", progress.intakeProtein, progress.maxProtein, ThemeConstant.colorSecondaryDark),
        ...pair("Carbohydrate", progress.intakeCarbohydrate, progress.maxCarbohydrate, ThemeConstant.colorAccentLight),
        ...pair("Fat", progress.intakeFat, progress.maxFat, ThemeConstant.colorAccentDark),
      ],
    );
  }

  List<Widget> pair(String name, double val1, double val2, Color color) {
    return [
      Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 16, bottom: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(name),
            Text(
              '${val1.toStringAsFixed(2)} / ${val2.toStringAsFixed(2)} g.',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      LinearPercentIndicator(
        lineHeight: 10,
        percent: val1 / val2 > 1 ? 1 : val1 / val2,
        backgroundColor: Colors.black12,
        progressColor: color,
        barRadius: const Radius.circular(15),
      ),
    ];
  }
}
