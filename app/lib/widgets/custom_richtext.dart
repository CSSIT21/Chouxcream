import 'package:chouxcream_app/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class CustomRichText extends StatelessWidget {
  final String description;
  final String text;
  final Function() onTap;
  const CustomRichText({Key? key,
  required this.description,
  required this.text,
  required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.149,
        top: MediaQuery.of(context).size.height * 0.08
      ),
      child: Text.rich(
        TextSpan(
          text: description,
          style: const TextStyle(color: Colors.black87, fontSize: 16),
          children: [
            TextSpan(
              text: text,
              style:  TextStyle(
                color: ThemeConstant.colorPrimary, fontSize: 16 ),
                recognizer: TapGestureRecognizer()..onTap = onTap
            ),
          ]
        ),
      ),
    );
  }
}
