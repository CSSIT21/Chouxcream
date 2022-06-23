import 'package:chouxcream_app/widgets/custom_formfield.dart';
import 'package:chouxcream_app/widgets/info_button.dart';
import 'package:flutter/material.dart';

class SecondInfoForm extends StatefulWidget {
  const SecondInfoForm({Key? key}) : super(key: key);

  @override
  State<SecondInfoForm> createState() => _SecondInfoFormState();
}

class _SecondInfoFormState extends State<SecondInfoForm> {
  final _height = TextEditingController();
  final _weight = TextEditingController();
  final _desireWeight = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBar(
          centerTitle: true,
          title: const Text(
            "Information",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
          ),
          backgroundColor: const Color(0xFFE07D12),
        ),
      ),
      body: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
          child: ListView(
            children: [
              const SizedBox(
                height: 140,
              ),
              CustomFormField(
                  headingText: "Height",
                  hintText: "Enter height",
                  obsecureText: false,
                  suffixIcon: const SizedBox(),
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  controller: _weight,
                  suffixText: "Centimeters",
                  fontsize: 20,
                  maxLines: 1),
              const SizedBox(
                height: 60,
              ),
              CustomFormField(
                  headingText: "Weight",
                  hintText: "Enter weight",
                  obsecureText: false,
                  suffixIcon: const SizedBox(),
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  controller: _weight,
                  suffixText: "Kolograms",
                  fontsize: 20,
                  maxLines: 1),
              const SizedBox(
                height: 60,
              ),
              CustomFormField(
                  headingText: "Desired weight",
                  hintText: "Enter weight",
                  obsecureText: false,
                  suffixIcon: const SizedBox(),
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  controller: _desireWeight,
                  suffixText: "Kilograms",
                  fontsize: 20,
                  maxLines: 1),
              const InfoButton()
            ],
          ),
        ),
      ),
    );
  }
}
