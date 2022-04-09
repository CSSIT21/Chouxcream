import 'package:chouxcream_app/screens/record/index.dart';
import 'package:flutter/material.dart';

class TodayFragment extends StatefulWidget {
  const TodayFragment({Key? key}) : super(key: key);

  @override
  State<TodayFragment> createState() => _TodayFragmentState();
}

class _TodayFragmentState extends State<TodayFragment> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Today"),
        ElevatedButton(
            onPressed: () {
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return const RecordFragment();
                },
              );
            },
            child: const Text("Add new record"))
      ],
    );
  }
}
