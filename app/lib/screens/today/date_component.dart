import 'package:flutter/material.dart';
import 'package:simple_moment/simple_moment.dart';

class DateComponent extends StatelessWidget {
  const DateComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Today",
            style: TextStyle(fontSize: 36, color: Colors.black),
          ),
          Text(
            Moment.now().format("dd MMM"),
            style:
                const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 124, 120, 120)),
          )
        ],
      ),
    );
  }
}
