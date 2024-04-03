import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    super.key,
    required this.backgroundColor,
    required this.iconColor,
    required this.icon,
  });

  final Color backgroundColor;
  final Color iconColor;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(10)),
      child: Icon(
        icon,
        color: iconColor,
        size: 24,
      ),
    );
  }
}
