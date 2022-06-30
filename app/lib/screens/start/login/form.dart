import 'dart:async';

import 'package:chouxcream_app/classes/theme.dart';
import 'package:chouxcream_app/screens/core/index.dart';
import 'package:chouxcream_app/screens/start/signup/signup_form.dart';
import 'package:chouxcream_app/screens/start/welcome/index.dart';
import 'package:chouxcream_app/widgets/custom_form_field.dart';
import 'package:chouxcream_app/widgets/custom_header.dart';
import 'package:chouxcream_app/widgets/custom_rich_text.dart';
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
  final RoundedLoadingButtonController _loginBtnController =
      RoundedLoadingButtonController();
  final _formkey = GlobalKey<FormState>();

  // Just a mock function to simulating network activity delay
  void _loginCall() async {
    Timer(const Duration(milliseconds: 2500), () {
      _loginBtnController.success();
      _loginNavigate();
    });
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
    return SafeArea(
      child: Stack(
        children: [
          Positioned(
            child: Container(
              color: const Color(0xFFE07D12),
            ),
          ),
          Positioned(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomHeader(
                  text: 'Log In',
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WelcomeScreen()));
                  },
                ),
                Expanded(
                  flex: 1,
                  key: _formkey,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40))),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 200,
                                margin:
                                    const EdgeInsets.symmetric(vertical: 30),
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
                                  suffixText: "",
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
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
                                  hintText: "At least 8 Character",
                                  suffixText: "",
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  fontsize: 14,
                                  fontweight: FontWeight.w500,
                                  validator: (value) {
                                    return null;
                                  },
                                  obsecureText: true,
                                  suffixIcon: IconButton(
                                      icon: const Icon(Icons.visibility),
                                      onPressed: () {}),
                                  textInputType: TextInputType.text,
                                  textInputAction: TextInputAction.done,
                                  controller: _passwordController,
                                  maxLines: 1),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 16, horizontal: 24),
                                    child: InkWell(
                                      onTap: () {},
                                      child: const Text(
                                        "Forgot Password?",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 248, 193, 110),
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
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20)),
                              ),
                              CustomRichText(
                                  description: "Don't have an account?",
                                  text: "Sign Up",
                                  onTap: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SignUp()));
                                  })
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
