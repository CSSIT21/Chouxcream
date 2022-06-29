import 'dart:async';

import 'package:chouxcream_app/classes/theme.dart';
import 'package:chouxcream_app/screens/start/information/index.dart';
import 'package:chouxcream_app/screens/start/login/index.dart';
import 'package:chouxcream_app/widgets/custom_form_field.dart';
import 'package:chouxcream_app/widgets/custom_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _userName = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String get userName => _userName.text.trim();

  String get rmail => _emailController.text.trim();

  String get password => _passwordController.text.trim();
  final RoundedLoadingButtonController _loginBtnController =
      RoundedLoadingButtonController();

  // Just a mock function to simulating network activity delay
  void _signupCall() async {
    Timer(const Duration(milliseconds: 2500), () {
      _loginBtnController.success();
      _signupNavigate();
    });
  }

  void _signupNavigate() async {
    Timer(const Duration(milliseconds: 1500), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const InformationScreen()),
          (Route<dynamic> route) =>
              false); // Clear all navigation stack and then navigate
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 200,
          margin: const EdgeInsets.symmetric(vertical: 32),
          child: Image.asset(
            'lib/asset/images/signup2.png',
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        CustomFormField(
            headingText: "Username",
            hintText: "Username",
            suffixText: "",
            fontsize: 14,
            fontweight: FontWeight.w500,
            validator: (value) {
              return null;
            },
            obsecureText: false,
            suffixIcon: const SizedBox(),
            textInputType: TextInputType.text,
            textInputAction: TextInputAction.done,
            controller: _userName,
            maxLines: 1),
        const SizedBox(
          height: 16,
        ),
        CustomFormField(
            headingText: "Email",
            hintText: "Email",
            suffixText: "",
            fontsize: 14,
            fontweight: FontWeight.w500,
            validator: (value) {
              return null;
            },
            obsecureText: false,
            suffixIcon: const SizedBox(),
            textInputType: TextInputType.text,
            textInputAction: TextInputAction.done,
            controller: _emailController,
            maxLines: 1),
        const SizedBox(
          height: 16,
        ),
        CustomFormField(
            headingText: "Password",
            hintText: "At least 8 character",
            fontsize: 14,
            fontweight: FontWeight.w500,
            suffixText: "",
            validator: (value) {
              return null;
            },
            obsecureText: true,
            suffixIcon: IconButton(
              icon: const Icon(Icons.visibility),
              onPressed: () {},
            ),
            textInputType: TextInputType.text,
            textInputAction: TextInputAction.done,
            controller: _passwordController,
            maxLines: 1),
        const SizedBox(
          height: 70,
        ),
        RoundedLoadingButton(
          controller: _loginBtnController,
          onPressed: _signupCall,
          color: ThemeConstant.colorPrimary,
          child: const Text('Sign Up',
              style: TextStyle(color: Colors.white, fontSize: 20)),
        ),
        CustomRichText(
            description: "Already have an account?",
            text: "Login here",
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            })
      ],
    );
  }
}
