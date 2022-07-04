import 'dart:async';

import 'package:chouxcream_app/classes/caller.dart';
import 'package:chouxcream_app/screens/core/index.dart';
import 'package:chouxcream_app/screens/start/preference/second_preference_form.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';

class SecondPreferenceScreen extends StatefulWidget {
  final String selectedGender;
  final DateTime selectedBirthDate;

  const SecondPreferenceScreen({Key? key, required this.selectedGender, required this.selectedBirthDate})
      : super(key: key);

  @override
  State<SecondPreferenceScreen> createState() => _SecondPreferenceScreenState();
}

class _SecondPreferenceScreenState extends State<SecondPreferenceScreen> {
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  final _desireWeightController = TextEditingController();

  submit() {
    // * Parse input values
    late double height;
    late double weight;
    late double desireWeight;
    try {
      height = double.parse(_heightController.text);
      weight = double.parse(_weightController.text);
      desireWeight = double.parse(_desireWeightController.text);
    } on FormatException {
      Caller.error(context, "Invalid input values");
      return;
    }

    // * Display progress dialog
    CustomProgressDialog progressDialog = CustomProgressDialog(
      context,
      blur: 5,
      dismissable: false,
    );
    progressDialog.show();

    // * Call preference update endpoint
    Caller.dio.patch("/profile/preference", data: {
      "gender": widget.selectedGender,
      "birth_date": widget.selectedBirthDate.toUtc().toIso8601String(),
      "height": height,
      "weight": weight,
      "desired_weight": desireWeight,
    }).then((response) {
      Caller.inform(context, response.data["message"]);
      progressDialog.dismiss();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const CoreScreen()),
        (route) => false,
      );
    }).onError((DioError error, _) {
      Caller.handle(context, error);
      progressDialog.dismiss();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 76,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Preference Setup",
            ),
            Container(
              height: 4,
            ),
            const Text(
              "Step 2/2",
              style: TextStyle(fontSize: 16, color: Colors.white70),
            )
          ],
        ),
      ),
      body: SecondPreferenceForm(
        heightController: _heightController,
        weightController: _weightController,
        desireWeightController: _desireWeightController,
      ),
      floatingActionButton: FloatingActionButton(onPressed: submit, child: const Icon(Icons.save)),
    );
  }
}
