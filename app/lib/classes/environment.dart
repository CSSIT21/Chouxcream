class EnvironmentConstant {
  static bool production = const bool.fromEnvironment('dart.vm.product');
  static String api = production ? "https://chouxcream.bsthun.com/api" : "http://10.2.1.111:3000/api";
}
