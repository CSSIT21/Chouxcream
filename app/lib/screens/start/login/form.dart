import 'dart:async';

import 'package:chouxcream_app/constants/theme.dart';
import 'package:chouxcream_app/screens/core/index.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class Form extends StatefulWidget {
  const Form({Key? key}) : super(key: key);

  @override
  State<Form> createState() => _FormState();
}

class _FormState extends State<Form> {
  final RoundedLoadingButtonController _loginBtnController = RoundedLoadingButtonController();

  // Just a mock function to simulating network activity delay
  void _loginCall() async {
    Timer(const Duration(milliseconds: 2500), () {
      _loginBtnController.success();
      _loginNavigate();
    });
  }

  void _loginNavigate() async {
    Timer(const Duration(milliseconds: 1500), () {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const CoreScreen()),
          (Route<dynamic> route) => false); // Clear all navigation stack and then navigate
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RoundedLoadingButton(
          child: const Text('Login', style: TextStyle(color: Colors.white, fontSize: 20)),
          color: ThemeConstant.colorPrimary,
          controller: _loginBtnController,
          onPressed: _loginCall,
        ),
      ],
    );
  }
}
