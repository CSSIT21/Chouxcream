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
    double _width = MediaQuery.of(context).size.width;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text('Daily Intake',
              style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),
            )
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0),
          child: Text('Calories'),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: LinearPercentIndicator(
            width: _width*0.9,
            lineHeight: 15.0,
            percent: 0.8,
            progressColor: ThemeConstant.colorPrimary,
            barRadius: Radius.circular(15),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0),
          child: Text('Carbohydrates'),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: LinearPercentIndicator(
            width: _width*0.9,
            lineHeight: 15.0,
            percent: 0.6,
            progressColor: ThemeConstant.colorSecondaryLight,
            barRadius: Radius.circular(15),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0),
          child: Text('Proteins'),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: LinearPercentIndicator(
            width: _width*0.9,
            lineHeight: 15.0,
            percent: 0.3,
            progressColor: ThemeConstant.colorAccentLight,
            barRadius: Radius.circular(15),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0),
          child: Text('Fats'),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: LinearPercentIndicator(
            width: _width*0.9,
            lineHeight: 15.0,
            percent: 0.5,
            progressColor: ThemeConstant.colorAccentDark,
            barRadius: Radius.circular(15),
          ),
        ),
      ],
    );
  }
}
