import 'package:chouxcream_app/constants/manifest.dart';
import 'package:chouxcream_app/constants/route.dart';
import 'package:chouxcream_app/constants/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // Root widget of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ManifestConstant.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeConstant.theme,
      routes: RouteConstant.route(),
      initialRoute: "/",
    );
  }
}
