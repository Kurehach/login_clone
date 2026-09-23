import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final Color borderColor;
  final Color focusedBorderColor;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.style,
    this.hintStyle,
    this.borderColor = Colors.grey,
    this.focusedBorderColor = Colors.green,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: TextField(
        controller: controller,
        style: style,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: hintStyle,
          border: const OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: focusedBorderColor),
          ),
        ),
      ),
    );
  }
}