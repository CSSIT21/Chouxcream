import 'package:flutter/material.dart';

class PreferenceForm extends StatefulWidget {
  final String selectedGender;
  final DateTime selectedBirthDate;
  final Function(String) setGender;
  final Function(DateTime) setBirthDate;

  const PreferenceForm({
    Key? key,
    required this.selectedGender,
    required this.selectedBirthDate,
    required this.setGender,
    required this.setBirthDate,
  }) : super(key: key);

  @override
  State<PreferenceForm> createState() => _PreferenceFormState();
}

class _PreferenceFormState extends State<PreferenceForm> {
  final List<String> _genders = ['Male', 'Female', 'Unspecified'];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                "Gender",
                style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFEBEBEB),
                ),
                value: widget.selectedGender,
                items: _genders.map((value) {
                  return DropdownMenuItem<String>(
                    value: value.substring(0, 1),
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  widget.setGender(value!);
                }),
            const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 10),
              child: Text(
                "Birthdate",
                style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            TextFormField(
              readOnly: true,
              controller: TextEditingController()
                ..text =
                    "${widget.selectedBirthDate.year.toString()}-${widget.selectedBirthDate.month.toString().padLeft(2, '0')}-${widget.selectedBirthDate.day.toString().padLeft(2, '0')}",
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color(0xFFEBEBEB),
              ),
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: widget.selectedBirthDate,
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                ).then((value) {
                  widget.setBirthDate(value!);
                });
              },
            ),
          ]),
    );
  }
}
