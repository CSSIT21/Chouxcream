import 'package:chouxcream_app/constants/theme.dart';
import 'package:flutter/material.dart';

class Content extends StatelessWidget {
  const Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 320,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Welcome to",
                style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w300),
              ),
              const Text(
                "Chouxcream",
                style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                "A new way to find the perfect match\nof foods,personalized just for you.\nEnjoy your meals while keeping\nyourself healthy, let’s start now!",
                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                  width: 192,
                  height: 48,
                  child: OutlinedButton(
                    child: const Text(
                      "Get started",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(Colors.white.withOpacity(0.2)),
                        shape: MaterialStateProperty.all(ThemeConstant.philBorderShape),
                        side: MaterialStateProperty.all(
                            const BorderSide(color: Colors.white, width: 1.2, style: BorderStyle.solid))),
                    onPressed: () {},
                  ))
            ]));
  }
}
