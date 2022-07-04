import 'dart:async';

import 'package:chouxcream_app/classes/caller.dart';
import 'package:chouxcream_app/classes/theme.dart';
import 'package:chouxcream_app/screens/start/login/index.dart';
import 'package:chouxcream_app/widgets/custom_form_field.dart';
import 'package:chouxcream_app/widgets/custom_rich_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _loginBtnController = RoundedLoadingButtonController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isHidden = true;

  String get name => _nameController.text.trim();

  String get email => _emailController.text.trim();

  String get password => _passwordController.text.trim();

  void signupCall() async {
    Caller.dio.post("/account/signup", data: {
      "name": name,
      "email": email,
      "password": password,
    }).then((response) async {
      // * Display success message
      _loginBtnController.success();

      // * Navigate to login screen
      Timer(const Duration(milliseconds: 1000), () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
      });
    }).onError((DioError error, _) {
      // * Apply default error handling
      Caller.handle(context, error);

      // * Display error feedback
      _loginBtnController.error();

      // * Reset form
      Timer(const Duration(milliseconds: 2500), () {
        _loginBtnController.reset();
      });
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
            headingText: "Name",
            hintText: "Name",
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
            controller: _nameController,
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
              onPressed: () {
                setState(() {
                  _isHidden = !_isHidden;
                });
              },
            ),
            textInputType: TextInputType.text,
            textInputAction: TextInputAction.done,
            controller: _passwordController,
            maxLines: 1),
        const SizedBox(
          height: 24,
        ),
        RoundedLoadingButton(
          controller: _loginBtnController,
          onPressed: signupCall,
          color: ThemeConstant.colorPrimary,
          child: const Text('Sign Up', style: TextStyle(color: Colors.white, fontSize: 20)),
        ),
        CustomRichText(
            description: "Already have an account?",
            text: "Login here",
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
            })
      ],
    );
  }
}
