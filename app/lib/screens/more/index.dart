import 'package:chouxcream_app/classes/caller.dart';
import 'package:chouxcream_app/models/user/user_information.dart';
import 'package:chouxcream_app/screens/more/edit_info/edit_info.dart';
import 'package:chouxcream_app/screens/more/help_center/help_center.dart';
import 'package:chouxcream_app/screens/more/title.dart';
import 'package:chouxcream_app/screens/start/preference/preference_screen.dart';
import 'package:chouxcream_app/screens/start/welcome/index.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoreFragment extends StatefulWidget {
  const MoreFragment({Key? key}) : super(key: key);

  @override
  State<MoreFragment> createState() => _MoreFragmentState();
}

class _MoreFragmentState extends State<MoreFragment> {
  late SharedPreferences prefs;
  User? user;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() {
    Caller.dio.get("/profile/info").then((response) {
      setState(() {
        user = User.fromJson(response.data["data"]);
      });
    }).onError((DioError error, _) {
      Caller.handle(context, error);
    });
  }

  logout() async {
    prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    if (mounted) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const WelcomeScreen()),
        (route) => false,
      );
    }
  }

  edit() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => EditProfile(
                  update: init,
                  user: user!,
                )));
  }

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [CircularProgressIndicator()],
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 40.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  maxRadius: 40.0,
                  backgroundImage: NetworkImage(user!.avatarUrl),
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 25, horizontal: 12)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user!.name,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: edit,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("Edit Information"),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            child: Icon(
                              Icons.navigate_next_rounded,
                              size: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const titleBar(title: "Preference Setup", routes: PreferenceScreen()),
          const titleBar(title: "Help Center", routes: HelpCenter()),
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  alignment: Alignment.center,
                  title: const Icon(
                    Icons.warning_rounded,
                    color: Colors.red,
                    size: 60.0,
                  ),
                  content: const Text('Are you sure, you want to logout?'),
                  actionsAlignment: MainAxisAlignment.spaceEvenly,
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('CANCEL'),
                    ),
                    TextButton(
                      onPressed: logout,
                      child: const Text(
                        'LOG OUT',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              );
            },
            child: Container(
              alignment: Alignment.centerLeft,
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Text("Log out",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.none)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
