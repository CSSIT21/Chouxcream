import 'package:chouxcream_app/screens/start/welcome/background.dart';
import 'package:chouxcream_app/screens/start/welcome/content.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: const [
        Positioned.fill(child: Background()),
        Center(
          child: Content(),
        ),
      ]),
    );
  }
}
