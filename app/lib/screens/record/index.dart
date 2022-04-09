import 'package:flutter/material.dart';

class RecordFragment extends StatefulWidget {
  const RecordFragment({Key? key}) : super(key: key);

  @override
  State<RecordFragment> createState() => _RecordFragmentState();
}

class _RecordFragmentState extends State<RecordFragment> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 520, child: const Text("Record"));
  }
}
