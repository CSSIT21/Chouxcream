import 'dart:async' as async;

import 'package:chouxcream_app/classes/caller.dart';
import 'package:chouxcream_app/classes/theme.dart';
import 'package:chouxcream_app/screens/core/index.dart';
import 'package:chouxcream_app/screens/start/welcome/index.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _SplashScreenState();

  Future navigate() async {
    // Get user token from shared preferences
    final prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('token') ?? "";

    // Set caller token value
    Caller.setToken(token);

    // Navigate to next screen
    async.Timer(const Duration(milliseconds: 2500), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => token == ""
                  ? const WelcomeScreen()
                  : const CoreScreen())); // Use pushReplacement for clear backstack.
    });
  }

  @override
  void initState() {
    super.initState();
    navigate();
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
                child: const Center(
                  child: Text(
                    "CHOUXCREAM",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 32),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
