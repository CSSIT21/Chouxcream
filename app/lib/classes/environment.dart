class EnvironmentConstant {
  static bool production = const bool.fromEnvironment('dart.vm.product');
  static String api = production ? "https://chouxcream.bsthun.com/api" : "http://localhost:3000/api";
}
