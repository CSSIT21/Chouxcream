import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CalorieComponent extends StatelessWidget {
  final double calorie;
  final double bmr;

  const CalorieComponent({Key? key, required this.calorie, required this.bmr}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Calories",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text("${calorie.toStringAsFixed(0)}/${bmr.toStringAsFixed(0)} kcal")
        ],
      ),
      const SizedBox(height: 10),
      calorie > bmr
          ? Container(
              margin: const EdgeInsets.symmetric(
                vertical: 12,
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: Colors.red,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                child: Row(
                  children: const [
                    Icon(Icons.warning_amber_rounded, color: Colors.white),
                    SizedBox(width: 10),
                    Flexible(
                      child: Text("You have gained more than recommended calories per day.",
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                    )
                  ],
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: LinearPercentIndicator(
                width: MediaQuery.of(context).size.width - 50,
                animation: false,
                lineHeight: 10.0,
                animationDuration: 2500,
                percent: calorie / bmr > 1 ? 1 : calorie / bmr,
                barRadius: const Radius.circular(5),
                progressColor: const Color(0xFF407CD6),
              ),
            )
    ]);
  }
}
