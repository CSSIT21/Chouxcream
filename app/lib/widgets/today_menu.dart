import 'package:chouxcream_app/models/menu/record.dart';
import 'package:chouxcream_app/utils/extension/string.dart';
import 'package:flutter/material.dart';

class TodayMenu extends StatelessWidget {
  final Record record;
  final void Function()? onPressedOne;
  final void Function()? onPressedTwo;
  final TextEditingController? controller;

  const TodayMenu({
    Key? key,
    this.controller,
    this.onPressedOne,
    this.onPressedTwo,
    required this.record,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        clipBehavior: Clip.hardEdge,
        child: Ink(
          color: Colors.white,
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              // showDialog(
              //     context: context,
              //     builder: (context) => AlertDialog(
              //           alignment: Alignment.center,
              //           title: const Text("Custom Calories"),
              //           content: TextField(
              //             onChanged: (value) {
              //               valueText = value;
              //             },
              //             controller: controller,
              //             decoration: const InputDecoration(hintText: "Enter Calories"),
              //           ),
              //           actions: <Widget>[
              //             FlatButton(onPressed: onPressedone, child: Text("CANCLE")),
              //             FlatButton(onPressed: onPressedtwo, child: Text("OK"))
              //           ],
              //         ));
            },
            child: Row(
              children: [
                Image.network(
                  record.menuImageUrl,
                  fit: BoxFit.cover,
                  height: 100,
                  width: 100,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      record.menuName,
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      record.meal.capitalize(),
                      style: const TextStyle(fontSize: 16, color: Color.fromARGB(255, 124, 120, 120)),
                    ),
                    Text("${record.calorie.toStringAsFixed(0)} kcal",
                        style: const TextStyle(fontSize: 16, color: Color.fromARGB(255, 124, 120, 120)))
                  ],
                ),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Icon(Icons.navigate_next_rounded),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
