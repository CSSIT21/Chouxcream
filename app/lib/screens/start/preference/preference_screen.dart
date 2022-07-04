import 'package:chouxcream_app/screens/start/preference/preference_form.dart';
import 'package:chouxcream_app/screens/start/preference/second_preference_screen.dart';
import 'package:flutter/material.dart';

class PreferenceScreen extends StatefulWidget {
  const PreferenceScreen({Key? key}) : super(key: key);

  @override
  State<PreferenceScreen> createState() => _PreferenceScreenState();
}

class _PreferenceScreenState extends State<PreferenceScreen> {
  String _selectedGender = "U";
  DateTime _selectedBirthDate = DateTime.now();

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

  submit() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SecondPreferenceScreen(
                selectedGender: _selectedGender,
                selectedBirthDate: _selectedBirthDate,
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
