import 'dart:async' as async;

import 'package:chouxcream_app/constants/environment.dart';
import 'package:chouxcream_app/constants/theme.dart';
import 'package:chouxcream_app/screens/start/welcome/index.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _SplashScreenState() {
    async.Timer(const Duration(milliseconds: 2500), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  const WelcomeScreen()) // Use pushReplacement for clear backstack.
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: .6,
              child: Container(
                child: const Center(
                  child: Text(
                    "CHOUXCREAM",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 32),
                  ),
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        ThemeConstant.colorSecondaryDark,
                        ThemeConstant.colorPrimary
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      tileMode: TileMode.mirror,
                      stops: const [.4, 12]),
                ),
                child: Column(
                  children: [
                    Text(EnvironmentConstant.production ? "Production" : "Development")
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
