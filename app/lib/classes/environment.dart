class EnvironmentConstant {
  static bool production = const bool.fromEnvironment('dart.vm.product');
  static String api = production ? "http://localhost:3000/api" : "https://chouxcream.bsthun.com/api";
}
