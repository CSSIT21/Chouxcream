import 'package:flutter/material.dart';

class CarbDivider extends StatelessWidget {
  const CarbDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      width: 1,
      height: 56,
      color: Colors.black26,
    );
  }
}
