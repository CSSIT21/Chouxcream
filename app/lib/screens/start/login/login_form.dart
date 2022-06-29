import 'dart:async';

import 'package:chouxcream_app/classes/caller.dart';
import 'package:chouxcream_app/classes/theme.dart';
import 'package:chouxcream_app/screens/core/index.dart';
import 'package:chouxcream_app/screens/start/signup/index.dart';
import 'package:chouxcream_app/widgets/custom_form_field.dart';
import 'package:chouxcream_app/widgets/custom_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String get email => _emailController.text.trim();

  String get password => _passwordController.text.trim();

  final RoundedLoadingButtonController _loginBtnController =
      RoundedLoadingButtonController();

  // * Login action
  void _loginCall() async {
    Caller.dio
        .post("/account/login", data: {
          "email": email,
          "password": password,
        })
        .then((value) => debugPrint(value.toString()))
        .catchError((error) => {

    });
    // Timer(const Duration(milliseconds: 2500), () {
    //   _loginBtnController.success();
    //   _loginNavigate();
    // });
  }

  void _loginNavigate() async {
    Timer(const Duration(milliseconds: 1500), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const CoreScreen()),
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
        Column(
          children: [
            Container(
              height: 200,
              margin: const EdgeInsets.symmetric(vertical: 64),
              child: Image.asset(
                'lib/asset/images/signin.png',
              ),
            ),
            CustomFormField(
                headingText: "Email",
                hintText: "hello@example.com",
                suffixText: "",
                fontsize: 14,
                fontweight: FontWeight.w500,
                obsecureText: false,
                validator: (value) {
                  return null;
                },
                suffixIcon: const SizedBox(),
                textInputType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
                controller: _emailController,
                maxLines: 1),
            const SizedBox(
              height: 16,
            ),
            CustomFormField(
                headingText: "Password",
                hintText: "at least 8 character",
                suffixText: "",
                fontsize: 14,
                fontweight: FontWeight.w500,
                validator: (value) {
                  return null;
                },
                obsecureText: true,
                suffixIcon: IconButton(
                    icon: const Icon(Icons.visibility), onPressed: () {}),
                textInputType: TextInputType.text,
                textInputAction: TextInputAction.done,
                controller: _passwordController,
                maxLines: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  child: InkWell(
                    onTap: () {},
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(
                          color: Color.fromARGB(255, 248, 193, 110),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
        Column(
          children: [
            RoundedLoadingButton(
              color: ThemeConstant.colorPrimary,
              controller: _loginBtnController,
              onPressed: _loginCall,
              child: const Text('Login',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
            CustomRichText(
                description: "Don't have an account?",
                text: "Sign Up",
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignupScreen()));
                })
          ],
        )
      ],
    );
  }
}
