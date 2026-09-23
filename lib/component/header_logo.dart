import 'package:flutter/material.dart';

class HeaderLogo extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color color;

  const HeaderLogo({
    super.key,
    required this.icon,
    this.size = 80.0,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: size,
      color: color,
    );
  }
}