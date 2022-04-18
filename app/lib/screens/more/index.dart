import 'package:chouxcream_app/screens/more/title.dart';
import 'package:flutter/material.dart';

class MoreFragment extends StatefulWidget {
  const MoreFragment({Key? key}) : super(key: key);

  @override
  State<MoreFragment> createState() => _MoreFragmentState();
}

class _MoreFragmentState extends State<MoreFragment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 32.0, horizontal: 80.0),
        child: Column(
          children: [
            profileSection(),
            titleBar(title: "Setting", routes: ""),
            titleBar(title: "Help center", routes: ""),
            titleBar(title: "Achivement", routes: ""),
          ],
        ),
      ),
    );
  }
}

//profile edit
class profileSection extends StatefulWidget {
  const profileSection({ Key? key }) : super(key: key);

  @override
  State<profileSection> createState() => _profileSectionState();
}

class _profileSectionState extends State<profileSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              maxRadius: 50.0,
              child: const Text('user'),
            ),
            Padding(padding: EdgeInsets.all(32.0)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Username", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("edit information"),
              const Icon(Icons.navigate_next_rounded),
            ],
          ),
              ],
            )
          ],
        
      ),
    );
  }
}