import 'package:chouxcream_app/classes/theme.dart';
import 'package:chouxcream_app/screens/core/index.dart';
import 'package:chouxcream_app/screens/start/information/index.dart';
import 'package:flutter/material.dart';

class InfoButton extends StatelessWidget {
  const InfoButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20, top: 140),
            child: SizedBox(
              width: 82,
              height: 38,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const InformationScreen()));
                },
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                        ThemeConstant.pillBorderShape),
                    side: MaterialStateProperty.all(const BorderSide(
                        color: Color(0xFFE07D12),
                        width: 1.2,
                        style: BorderStyle.solid))),
                child: const Text(
                  "back",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
            ),
          ),
          const Spacer(),
          Container(
            margin: const EdgeInsets.only(right: 20, top: 140),
            child: SizedBox(
              width: 82,
              height: 38,
              child: OutlinedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                        ThemeConstant.pillBorderShape),
                    side: MaterialStateProperty.all(const BorderSide(
                        color: Color(0xFFE07D12),
                        width: 1.2,
                        style: BorderStyle.solid))),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => CoreScreen()));
                },
                child: const Text(
                  "next",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
