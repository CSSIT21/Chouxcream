import 'package:chouxcream_app/classes/theme.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class EditPassword extends StatefulWidget {
  const EditPassword({Key? key}) : super(key: key);

  @override
  State<EditPassword> createState() => _EditPasswordState();
}

class _EditPasswordState extends State<EditPassword> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _editBtnController = RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 40),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
          const Text("New Password"),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter password';
              } else if (value.length < 8) {
                return 'Your password length is incorrect';
              }
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: ThemeConstant.colorPrimary))),
          ),
          const SizedBox(
            height: 18,
          ),
          const Text("Confirm New Password"),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter confirm password';
              } else if (_passwordController.text != _confirmPasswordController.text) {
                return 'Confirm password is not match';
              }
            },
            controller: _confirmPasswordController,
            obscureText: true,
            decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: ThemeConstant.colorPrimary))),
          ),
          const SizedBox(
            height: 30,
          ),
          RoundedLoadingButton(
            height: 50,
            width: 420,
            color: ThemeConstant.colorAccentDark,
            controller: _editBtnController,
            onPressed: () {},
            child: const Text('Save'),
          ),
        ]));
  }
}
