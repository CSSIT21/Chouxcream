import 'package:chouxcream_app/constants/theme.dart';
import 'package:chouxcream_app/screens/more/title.dart';
import 'package:flutter/material.dart';

class MoreFragment extends StatefulWidget {
  const MoreFragment({Key? key}) : super(key: key);

  @override
  State<MoreFragment> createState() => _MoreFragmentState();
}

class _MoreFragmentState extends State<MoreFragment> {
  // late SharedPreferences prefs;

  // deleteUserData() async {
  //   prefs = await SharedPreferences.getInstance();
  //   await prefs.clear();
  // }

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
                    backgroundImage: NetworkImage(''),
                  ),
                  const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 25, horizontal: 12)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Username",
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
                // deleteUserData();
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
