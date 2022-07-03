import 'package:chouxcream_app/classes/environment.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_alert/flutter_platform_alert.dart';

class Caller {
  static BaseOptions options = BaseOptions(
    baseUrl: EnvironmentConstant.api,
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );

  static Dio dio = Dio(options);

  static setToken(String token) {
    dio.options.headers["Authorization"] = "Bearer $token";
  }

  static handle(BuildContext context, DioError error) {
    if (error.response == null) {
      FlutterPlatformAlert.showAlert(
          windowTitle: 'Something went wrong', text: error.message);
      return;
    }

    SnackBar snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(15),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(error.response!.data["message"]),
          error.response!.data["error"] == null
              ? Container()
              : Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(error.response!.data["error"]),
                ),
        ],
      ),
      action: SnackBarAction(
        label: 'OK',
        onPressed: () {},
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
