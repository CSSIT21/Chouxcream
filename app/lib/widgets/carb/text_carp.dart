import 'package:flutter/material.dart';

class TextCarb extends StatelessWidget {
  final String title;
  final String value;

  const TextCarb({Key? key, required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(value, style: const TextStyle(fontSize: 16)),
          Text(title, style: const TextStyle(color: Colors.black54))
        ],
      ),
    );
  }
}
