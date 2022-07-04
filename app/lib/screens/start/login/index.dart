import 'package:chouxcream_app/screens/start/login/login_form.dart';
import 'package:chouxcream_app/widgets/layout/start_layout.dart';
import 'package:chouxcream_app/widgets/system/empty_appbar.dart';
import 'package:flutter/material.dart' hide Form;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    // Learn more about tab bar: https://docs.flutter.dev/cookbook/design/tabs
    return const Scaffold(
        appBar: EmptyAppBar(),
        body: StartLayout(title: "Login", child: LoginForm()));
  }
}
