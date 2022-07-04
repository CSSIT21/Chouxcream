import 'dart:async';

import 'package:chouxcream_app/classes/caller.dart';
import 'package:chouxcream_app/classes/theme.dart';
import 'package:chouxcream_app/models/user/login_information.dart';
import 'package:chouxcream_app/screens/core/index.dart';
import 'package:chouxcream_app/screens/start/preference/preference_screen.dart';
import 'package:chouxcream_app/screens/start/signup/index.dart';
import 'package:chouxcream_app/widgets/custom_form_field.dart';
import 'package:chouxcream_app/widgets/custom_rich_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _loginBtnController = RoundedLoadingButtonController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obsecurePassword = true;

  String get email => _emailController.text.trim();

  String get password => _passwordController.text.trim();

  void loginCall() async {
    Caller.dio.post("/account/login", data: {
      "email": email,
      "password": password,
    }).then((response) async {
      // * Parse response
      final data = LoginInformation.fromJson(response.data["data"]);

      // * Load shared preferences
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('token', data.token);

      // * Set caller token value
      Caller.setToken(data.token);

      // * Display success feedback
      _loginBtnController.success();

      // * Navigate to screen
      Timer(const Duration(milliseconds: 1000), () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => data.preferenceSettled ? const PreferenceScreen() : const CoreScreen()),
            (Route<dynamic> route) => false); // Clear all navigation stack and then navigate
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
                obsecureText: _obsecurePassword,
                suffixIcon: IconButton(
                    icon: Icon(_obsecurePassword ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _obsecurePassword = !_obsecurePassword;
                      });
                    }),
                textInputType: TextInputType.text,
                textInputAction: TextInputAction.done,
                controller: _passwordController,
                maxLines: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  child: InkWell(
                    onTap: () {},
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(color: Color.fromARGB(255, 248, 193, 110), fontWeight: FontWeight.w500),
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
              onPressed: loginCall,
              child: const Text('Login', style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
            CustomRichText(
                description: "Don't have an account?",
                text: "Sign Up",
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignupScreen()));
                })
          ],
        )
      ],
    );
  }
}
