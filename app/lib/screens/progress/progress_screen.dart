import 'package:chouxcream_app/classes/caller.dart';
import 'package:chouxcream_app/models/menu/progress.dart';
import 'package:chouxcream_app/screens/progress/nutrition.dart';
import 'package:chouxcream_app/screens/progress/progress_chart.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({Key? key}) : super(key: key);

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  Progress? progress;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() {
    progress = null;
    Caller.dio.get("/tracking/progress").then((response) {
      setState(() {
        progress = Progress.fromJson(response.data["data"]);
      });
    }).onError((DioError error, _) {
      Caller.handle(context, error);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (progress == null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [CircularProgressIndicator()],
      );
    }

    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
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
          Card(
              child: SizedBox(
                  height: 300,
                  child: ProgressChart(
                    progress: progress!,
                  ))),
          const Padding(
            padding: EdgeInsets.only(
              top: 16,
            ),
            child: Text(
              'Daily Intake',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Nutrition(progress: progress!),
          Padding(
            padding: const EdgeInsets.only(bottom: 48),
            child: IconButton(onPressed: init, icon: Icon(Icons.refresh)),
          ),
        ],
      ),
    ));
  }
}
