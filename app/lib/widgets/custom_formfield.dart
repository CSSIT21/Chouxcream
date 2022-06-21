import 'package:flutter/material.dart';
import 'package:chouxcream_app/constants/theme.dart';

class CustomFormField extends StatelessWidget {
  final String headingText;
  final String hintText;
  final bool obsecureText;
  final Widget suffixIcon;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final TextEditingController controller;
  final int maxLines;

  const CustomFormField({Key? key,
  required this.headingText,
  required this.hintText,
  required this.obsecureText,
  required this.suffixIcon,
  required this.textInputType,
  required this.textInputAction,
  required this.controller,
  required this.maxLines
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 10,
          ),
          child: Text(
            headingText,
            style: TextStyle( color: Color(0xFFC7C7CD), fontSize: 14, fontWeight: FontWeight.w500
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          decoration: BoxDecoration(
            color: Color(0xFFEBEBEB),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: TextField(
              maxLines: maxLines,
              controller: controller,
              textInputAction: textInputAction,
              keyboardType: textInputType,
              obscureText: obsecureText,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(color: Color(0xFFC7C7CD), fontSize: 14, fontWeight: FontWeight.w500),
                border: InputBorder.none,
                suffixIcon: suffixIcon
              ),
            ),
          ),
        )
      ],
    );
  }
}
