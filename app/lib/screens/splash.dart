import 'dart:async' as async;

import 'package:chouxcream_app/classes/caller.dart';
import 'package:chouxcream_app/classes/theme.dart';
import 'package:chouxcream_app/models/user/login_information.dart';
import 'package:chouxcream_app/screens/core/index.dart';
import 'package:chouxcream_app/screens/start/preference/preference_screen.dart';
import 'package:chouxcream_app/screens/start/welcome/index.dart';
import 'package:dio/dio.dart';
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

    if (token == "") {
      return const WelcomeScreen();
    }

    // Set caller token value
    Caller.setToken(token);

    try {
      // * Call launch information endpoint
      final response = await Caller.dio.get("/profile/launch");

      // * Parse response
      final data = LoginInformation.fromJson(response.data["data"]);
      if (data.preferenceSettled) {
        return const CoreScreen();
      } else {
        return const PreferenceScreen();
      }
    } on DioError catch (e) {
      if (mounted) {
        Caller.handle(context, e);
        return const WelcomeScreen();
      }
    }
  }

  @override
  void initState() {
    super.initState();

    // Timer
    async.Timer(const Duration(milliseconds: 2500), () async {
      final navi = await navigate();
      if (mounted) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => navi)); // Use pushReplacement for clear backstack.
      }
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
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [ThemeConstant.colorSecondaryDark, ThemeConstant.colorPrimary],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      tileMode: TileMode.mirror,
                      stops: const [.4, 12]),
                ),
                child: const Center(
                  child: Text(
                    "CHOUXCREAM",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 32),
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
