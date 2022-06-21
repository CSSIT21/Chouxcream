import 'dart:async';

import 'package:chouxcream_app/constants/theme.dart';
import 'package:chouxcream_app/screens/core/index.dart';
import 'package:chouxcream_app/screens/start/signup/signup_form.dart';
import 'package:chouxcream_app/widgets/custom_formfield.dart';
import 'package:chouxcream_app/widgets/custom_header.dart';
import 'package:chouxcream_app/widgets/custom_richtext.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class Form extends StatefulWidget {
  const Form({Key? key}) : super(key: key);

  @override
  State<Form> createState() => _FormState();
}

class _FormState extends State<Form> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String get email => _emailController.text.trim();
  String get password => _passwordController.text.trim();
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
    return SafeArea(
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: const Color(0xFFE07D12),
          ),
          CustomHeader(
            text: 'Log In',
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignUp()));
            },
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.08,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width * 0.8,
                    margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.09),
                    child: Image.asset(
                      'lib/asset/images/signin.png',
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomFormField(
                      headingText: "Email",
                      hintText: "Email",
                      obsecureText: false,
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
                      hintText: "At least 8 Character",
                      obsecureText: true,
                      suffixIcon: IconButton(icon: const Icon(Icons.visibility), onPressed: () {}),
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
                  RoundedLoadingButton(
                    child: const Text('Login', style: TextStyle(color: Colors.white, fontSize: 20)),
                    color: ThemeConstant.colorPrimary,
                    controller: _loginBtnController,
                    onPressed: _loginCall,
                  ),
                  CustomRichText(
                      description: "Don't have an account?",
                      text: "Sign Up",
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignUp()));
                      })
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
