import 'package:chouxcream_app/classes/theme.dart';
import 'package:flutter/material.dart';

class EmptyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const EmptyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeConstant.colorPrimary,
    );
  }

  @override
  Size get preferredSize => const Size(0.0, 0.0);
}