import 'package:chouxcream_app/constants/theme.dart';
import 'package:chouxcream_app/models/user/user_information.dart';
import 'package:chouxcream_app/screens/more/title.dart';
import 'package:chouxcream_app/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoreFragment extends StatefulWidget {
  const MoreFragment({Key? key}) : super(key: key);

  @override
  State<MoreFragment> createState() => _MoreFragmentState();
}

class _MoreFragmentState extends State<MoreFragment> {
  late SharedPreferences prefs;
  User user = User(name: '', email: '', avatarUrl: '');
  
  void initState() {
    _readJson();
    super.initState();
  }

  deleteUserData() async {
    prefs = await SharedPreferences.getInstance();
    await prefs.remove('user');
  }

  Future<void> _readJson() async {
    User responseUser = await UserService.getData();
    if (mounted) {
      setState(() {
        user = responseUser;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // _navigate(BuildContext context) async {
    //   await Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //           builder: (context) => EditProfile())).then((_) => setState(() {}));
    // }

    return Container(
      child: Padding(
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
                    backgroundColor: ThemeConstant.colorSecondaryDark,
                    backgroundImage: NetworkImage(user.avatarUrl),
                  ),
                  const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 25, horizontal: 12)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.name,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          // _navigate(context);
                        },
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
            titleBar(title: "Setting", routes: ""),
            titleBar(title: "Help Center", routes: ""),
            titleBar(title: "Achivement", routes: ""),
            InkWell(
              onTap: () {
                deleteUserData();
                // Navigator.pushReplacement(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => LoginScreen()));
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
      ),
    );
  }
}
