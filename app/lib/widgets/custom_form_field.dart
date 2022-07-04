import 'package:flutter/material.dart';
import 'package:chouxcream_app/classes/theme.dart';

class CustomFormField extends StatelessWidget {
  final String headingText;
  final String hintText;
  final bool obsecureText;
  final Widget suffixIcon;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final TextEditingController controller;
  final int maxLines;
  final double? fontsize;
   final FontWeight? fontweight;
  final String suffixText;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;

  const CustomFormField({
    Key? key,
    required this.headingText,
    required this.hintText,
    required this.obsecureText,
    required this.suffixIcon,
    required this.textInputType,
    required this.textInputAction,
    required this.controller,
    required this.suffixText,
    this.validator,
    required this.fontsize,
    this.autovalidateMode,
    this.fontweight,
    required this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Text(
            headingText,
            style: TextStyle(
                color: Colors.black,
                fontSize: fontsize,
                fontWeight: fontweight),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: const Color(0xFFEBEBEB),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, top: 4),
            child: TextFormField(
              validator: validator,
              autovalidateMode: autovalidateMode,
              maxLines: maxLines,
              controller: controller,
              textInputAction: textInputAction,
              keyboardType: textInputType,
              obscureText: obsecureText,
              decoration: InputDecoration(
                  hintText: hintText,
                  suffixText: suffixText,
                  hintStyle: const TextStyle(
                      color: Color(0xFFC7C7CD),
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                  border: InputBorder.none,
                  suffixIcon: suffixIcon),
            ),
          ),
        )
      ],
    );
  }
}
