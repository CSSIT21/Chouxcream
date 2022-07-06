import 'package:chouxcream_app/screens/start/preference/preference_form.dart';
import 'package:chouxcream_app/screens/start/preference/second_preference_screen.dart';
import 'package:flutter/material.dart';

class PreferenceScreen extends StatefulWidget {
  final String? defaultGender;
  final DateTime? defaultBirthdate;
  final double? defaultHeight;
  final double? defaultWeight;
  final double? defaultDesireWeight;

  const PreferenceScreen(
      {Key? key,
      this.defaultGender,
      this.defaultBirthdate,
      this.defaultHeight,
      this.defaultWeight,
      this.defaultDesireWeight})
      : super(key: key);

  @override
  State<PreferenceScreen> createState() => _PreferenceScreenState();
}

class _PreferenceScreenState extends State<PreferenceScreen> {
  late String _selectedGender;
  late DateTime _selectedBirthDate;

  setSelectedGender(String value) {
    setState(() {
      _selectedGender = value;
    });
  }

  setSelectedBirthDate(DateTime value) {
    setState(() {
      _selectedBirthDate = value;
    });
  }

  @override
  void initState() {
    super.initState();
    load();
  }

  @override
  void didUpdateWidget(PreferenceScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget != widget) {
      load();
    }
  }

  load() {
    _selectedGender = widget.defaultGender ?? "M";
    _selectedBirthDate = widget.defaultBirthdate ?? DateTime.now();
  }

  submit() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SecondPreferenceScreen(
                selectedGender: _selectedGender,
                selectedBirthDate: _selectedBirthDate,
                selectedHeight: widget.defaultHeight ?? 150,
                selectedWeight: widget.defaultWeight ?? 50,
                selectedDesireWeight: widget.defaultDesireWeight ?? 40,
              )),
    );
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
              "Step 1/2",
              style: TextStyle(fontSize: 16, color: Colors.white70),
            )
          ],
        ),
      ),
      body: PreferenceForm(
        setGender: setSelectedGender,
        setBirthDate: setSelectedBirthDate,
        selectedGender: _selectedGender,
        selectedBirthDate: _selectedBirthDate,
      ),
      floatingActionButton: FloatingActionButton(onPressed: submit, child: const Icon(Icons.chevron_right)),
    );
  }
}
