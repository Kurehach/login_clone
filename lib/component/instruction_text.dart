import 'package:flutter/material.dart';

class InstructionText extends StatelessWidget {
  final String title;
  final String subtitle;
  final String linkText;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final TextStyle? linkStyle;
  final VoidCallback? onLinkTap;

  const InstructionText({
    super.key,
    required this.title,
    required this.subtitle,
    required this.linkText,
    this.titleStyle,
    this.subtitleStyle,
    this.linkStyle,
    this.onLinkTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: titleStyle, textAlign: TextAlign.center),
        const SizedBox(height: 16),
        Text(subtitle, style: subtitleStyle, textAlign: TextAlign.center),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: onLinkTap,
          child: Text(linkText, style: linkStyle, textAlign: TextAlign.center),
        ),
      ],
    );
  }
}