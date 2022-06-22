import 'dart:async';

import 'package:chouxcream_app/screens/start/information/index.dart';
import 'package:chouxcream_app/screens/start/login/index.dart';
import 'package:chouxcream_app/widgets/custom_formfield.dart';
import 'package:chouxcream_app/widgets/custom_header.dart';
import 'package:chouxcream_app/widgets/custom_richtext.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../../constants/theme.dart';
import '../../core/index.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: const Color(0xFFE07D12),
            ),
            CustomHeader(
              text: 'Sign Up.',
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              },
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.08,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.95,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width * 0.8,
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.09,
                          top: 5),
                      child: Image.asset('lib/asset/images/signup2.png'),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomFormField(
                        headingText: "Username",
                        hintText: "username",
                        suffixText: "",
                        fontsize: 14,
                        fontweight: FontWeight.w500,
                        validator: (ValueKey) {
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
                        validator: (ValueKey) {
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
                        validator: (ValueKey) {
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
                      child: const Text('Sign Up',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      color: ThemeConstant.colorPrimary,
                    ),
                    CustomRichText(
                        description: "Already have an account?",
                        text: "Login here",
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        })
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
