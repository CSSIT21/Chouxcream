import 'package:chouxcream_app/classes/theme.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Nutrition extends StatefulWidget {
  const Nutrition({Key? key}) : super(key: key);

  @override
  State<Nutrition> createState() => _NutritionState();
}

class _NutritionState extends State<Nutrition> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 8.0, bottom: 8),
          child: Text('Calories'),
        ),
        LinearPercentIndicator(
          lineHeight: 10,
          percent: 0.8,
          backgroundColor: Colors.black12,
          progressColor: ThemeConstant.colorPrimary,
          barRadius: const Radius.circular(15),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 8.0, top: 8, bottom: 8),
          child: Text('Carbohydrates'),
        ),
        LinearPercentIndicator(
          lineHeight: 10,
          percent: 0.6,
          backgroundColor: Colors.black12,
          barRadius: const Radius.circular(15),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 8.0, top: 8, bottom: 8),
          child: Text('Protein'),
        ),
        LinearPercentIndicator(
          lineHeight: 10,
          percent: 0.3,
          backgroundColor: Colors.black12,
          progressColor: ThemeConstant.colorAccentLight,
          barRadius: const Radius.circular(15),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 8.0, top: 8, bottom: 8),
          child: Text('Fat'),
        ),
        LinearPercentIndicator(
          lineHeight: 10,
          percent: 0.5,
          backgroundColor: Colors.black12,
          progressColor: ThemeConstant.colorAccentDark,
          barRadius: const Radius.circular(15),
        ),
      ],
    );
  }
}
