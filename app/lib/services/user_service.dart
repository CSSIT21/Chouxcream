import 'package:chouxcream_app/models/user/user_information.dart';
import 'package:dio/dio.dart';

class UserService {
  static Future<dynamic> getData() async {
    // final prefs = await SharedPreferences.getInstance();
    // final String? userToken = prefs.getString('user');
    try {
      Response response = await Dio().get('https://wwwii.bsthun.com/mock/chouxcream_tracker/account.json');
      return User.fromJson(response.data);
    } on DioError catch (e) {
      return "";
    }
  }
}
