import 'package:flutter/material.dart';

class TodayMenu extends StatelessWidget {
  final String name;
  final String meal;
  final String cal;
  final String img;
  final void Function()? onPressedone;
  final void Function()? onPressedtwo;
  final TextEditingController? controller;

  const TodayMenu(
      {Key? key,
      required this.name,
      required this.meal,
      required this.cal,
      this.controller,
      this.onPressedone,
      this.onPressedtwo,
      required this.img})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String valueText = '';
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  alignment: Alignment.center,
                  title: Text("Custom Calories"),
                  content: TextField(
                    onChanged: (value) {
                      valueText = value;
                    },
                    controller: controller,
                    decoration: InputDecoration(hintText: "Enter Calories"),
                  ),
                  actions: <Widget>[
                    FlatButton(
                        onPressed: onPressedone,
                        child: Text("CANCLE")),
                    FlatButton(
                        onPressed: onPressedtwo,
                        child: Text("OK"))
                  ],
                ));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(
          children: [
            Container(
                margin: EdgeInsets.only(left: 10, top: 10),
                width: 80,
                height: 80,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(img),
                )),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  meal,
                  style: const TextStyle(
                      fontSize: 16, color: Color.fromARGB(255, 124, 120, 120)),
                ),
                Text(cal,
                    style: const TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 124, 120, 120)))
              ],
            ),
            const Spacer(),
            const Icon(Icons.navigate_next_rounded)
          ],
        ),
      ),
    );
  }
}
