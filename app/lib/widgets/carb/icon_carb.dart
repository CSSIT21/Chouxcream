import 'package:flutter/material.dart';

class IconCarb extends StatelessWidget {
  final IconData icon;
  final String value;

  const IconCarb({
    Key? key,
    required this.icon,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 36,
        ),
        const SizedBox(width: 8),
        Text(
          value,
          style: const TextStyle(fontSize: 16),
        )
      ],
    );
  }
}
