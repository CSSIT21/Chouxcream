import 'package:chouxcream_app/screens/start/information/secondinfo.dart';
import 'package:chouxcream_app/widgets/custom_formfield.dart';
import 'package:flutter/material.dart';

import '../../../constants/theme.dart';

class InformationForm extends StatefulWidget {
  const InformationForm({Key? key}) : super(key: key);

  @override
  State<InformationForm> createState() => _InformationFormState();
}

class _InformationFormState extends State<InformationForm> {
  final _formkey = GlobalKey<FormState>();
  final _age = TextEditingController();
  String? selectedGender;
  List _types = ['Male', 'Female'];

  String get age => _age.text.trim();

  @override
  void initState() {
    selectedGender = _types[0];
  }

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
                height: 180,
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: 10,
                ),
                child: const Text(
                  "Gender",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                // decoration: BoxDecoration(
                //   color: Color(0xFFEBEBEB),
                //   borderRadius: BorderRadius.circular(15),
                // ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFEBEBEB)),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFEBEBEB)),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          filled: true,
                          fillColor: Color(0xFFEBEBEB),
                        ),
                        value: selectedGender,
                        items: _types.map((value) {
                          return DropdownMenuItem<String>(
                            child: Text(value),
                            value: value,
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value;
                          });
                        })
                  ],
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              CustomFormField(
                  headingText: "Age",
                  hintText: "Enter age",
                  obsecureText: false,
                  fontsize: 20,
                  fontweight: FontWeight.w600,
                  suffixIcon: const SizedBox(),
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  controller: _age,
                  suffixText: "Years",
                  validator: (ValueKey) {
                    return null;
                  },
                  maxLines: 1),
              Container(
                  margin: const EdgeInsets.only(
                    left: 40,
                    right: 10,
                    top: 80,
                  ),
                  child: SizedBox(
                      width: 42,
                      height: 48,
                      child: OutlinedButton(
                        child: const Text(
                          "Next",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                ThemeConstant.pillBorderShape),
                            side: MaterialStateProperty.all(const BorderSide(
                                color: Color(0xFFE07D12),
                                width: 1.2,
                                style: BorderStyle.solid))),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const SecondInfoForm()));
                        },
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
