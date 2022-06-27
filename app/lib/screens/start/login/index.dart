import 'package:chouxcream_app/screens/start/login/form.dart';
import 'package:chouxcream_app/widgets/system/empty_appbar.dart';
import 'package:flutter/material.dart' hide Form;
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    // Learn more about tab bar: https://docs.flutter.dev/cookbook/design/tabs
    return const Scaffold(appBar: EmptyAppBar(), body: Form());
  }
}
