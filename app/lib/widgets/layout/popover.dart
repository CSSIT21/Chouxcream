import 'package:flutter/material.dart';

class Popover extends StatelessWidget {
  final Widget child;

  const Popover({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.all(12),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [_buildHandle(context), child],
        ),
      ),
    );
  }

  Widget _buildHandle(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: 64,
      child: Container(
        height: 3,
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: theme.dividerColor,
          borderRadius: BorderRadius.circular(1.5),
        ),
      ),
    );
  }
}
