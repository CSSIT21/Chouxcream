import 'package:chouxcream_app/screens/splash.dart' show SplashScreen;
import 'package:chouxcream_app/screens/start/login/index.dart';
import 'package:chouxcream_app/screens/start/preference/preference_screen.dart';
import 'package:chouxcream_app/screens/start/welcome/index.dart' show WelcomeScreen;
import 'package:flutter/material.dart' as material;

class RouteConstant {
  static Map<String, material.WidgetBuilder> route() {
    return <String, material.WidgetBuilder>{
      '/': (_) => const SplashScreen(),
      '/welcome': (_) => const WelcomeScreen(),
      '/login': (_) => const LoginScreen(),
      '/preference': (_) => const PreferenceScreen(),
    };
  }
}
