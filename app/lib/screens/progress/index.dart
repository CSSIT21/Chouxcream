import 'package:chouxcream_app/screens/progress/nutrition.dart';
import 'package:chouxcream_app/screens/progress/progress_chart.dart';
import 'package:flutter/material.dart';

class ProgressFragment extends StatefulWidget {
  const ProgressFragment({Key? key}) : super(key: key);

  @override
  State<ProgressFragment> createState() => _ProgressFragmentState();
}

class _ProgressFragmentState extends State<ProgressFragment> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Text(
              'Weekly Progress',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Card(child: SizedBox(height: 300, child: ProgressChart())),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Text(
              'Daily Intake',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Nutrition(),
        ],
      ),
    ));
  }
}
