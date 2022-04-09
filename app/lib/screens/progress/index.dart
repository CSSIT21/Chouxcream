import 'package:chouxcream_app/screens/progress/chart.dart';
import 'package:flutter/material.dart';

class ProgressFragment extends StatefulWidget {
  const ProgressFragment({Key? key}) : super(key: key);

  @override
  State<ProgressFragment> createState() => _ProgressFragmentState();
}

class _ProgressFragmentState extends State<ProgressFragment> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
              child: Column(
            children: const [
              ListTile(
                leading: Icon(Icons.analytics_rounded),
                title: Text("Dashboard"),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(height: 300, child: BarChartWidget()),
              ),
            ],
          )),
        )
      ],
    );
  }
}
