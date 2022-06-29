import 'package:chouxcream_app/screens/start/welcome/index.dart';
import 'package:chouxcream_app/widgets/custom_header.dart';
import 'package:flutter/material.dart';

class StartLayout extends StatelessWidget {
  final Widget child;
  final String title;

  const StartLayout({Key? key, required this.child, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Container(
            color: const Color(0xFFE07D12),
          ),
        ),
        Positioned(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomHeader(
                text: title,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                  child: SingleChildScrollView(
                    child: child,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
