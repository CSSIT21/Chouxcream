import 'package:chouxcream_app/screens/start/signup/signup_form.dart';
import 'package:chouxcream_app/widgets/layout/start_layout.dart';
import 'package:chouxcream_app/widgets/system/empty_appbar.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: EmptyAppBar(),
        body: StartLayout(title: "Sign Up", child: SignupForm()));
  }
}
