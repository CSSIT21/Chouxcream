import 'package:chouxcream_app/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';

class SecondPreferenceForm extends StatelessWidget {
  final TextEditingController heightController;
  final TextEditingController weightController;
  final TextEditingController desireWeightController;

  const SecondPreferenceForm(
      {Key? key, required this.heightController, required this.weightController, required this.desireWeightController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        CustomFormField(
            headingText: "Height",
            hintText: "Enter height",
            obsecureText: false,
            suffixIcon: const SizedBox(),
            textInputType: TextInputType.number,
            textInputAction: TextInputAction.done,
            controller: heightController,
            suffixText: "centimeters",
            fontsize: 20,
            maxLines: 1),
        const SizedBox(
          height: 20,
        ),
        CustomFormField(
            headingText: "Weight",
            hintText: "Enter weight",
            obsecureText: false,
            suffixIcon: const SizedBox(),
            textInputType: TextInputType.number,
            textInputAction: TextInputAction.done,
            controller: weightController,
            suffixText: "kilograms",
            fontsize: 20,
            maxLines: 1),
        const SizedBox(
          height: 20,
        ),
        CustomFormField(
            headingText: "Desired weight",
            hintText: "Enter weight",
            obsecureText: false,
            suffixIcon: const SizedBox(),
            textInputType: TextInputType.number,
            textInputAction: TextInputAction.done,
            controller: desireWeightController,
            suffixText: "kilograms",
            fontsize: 20,
            maxLines: 1),
      ],
    );
  }
}
