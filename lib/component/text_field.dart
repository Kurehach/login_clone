import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextfieldS extends StatelessWidget {
  final String labelText;
  final TextEditingController txtController;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;
  final Widget? suffixIcon;

  const TextfieldS({
    super.key,
    required this.labelText,
    required this.txtController,
    this.keyboardType,
    this.inputFormatters,
    this.obscureText = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    const steamInputBg = Color(0xFF182330);
    const steamBorderColor = Color(0xFF2A3F5A);
    const steamFocusBlue = Color(0xFF66C0F4);
    const steamLabelColor = Color(0xFF8F98A0);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText.toUpperCase(),
            style: const TextStyle(
              color: steamLabelColor,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
            ),
          ),
          const SizedBox(height: 6),
          TextField(
            controller: txtController,
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
            obscureText: obscureText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
            cursorColor: steamFocusBlue,
            decoration: InputDecoration(
              filled: true,
              fillColor: steamInputBg,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 14,
              ),
              suffixIcon: suffixIcon,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(
                  color: steamBorderColor,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(
                  color: steamFocusBlue,
                  width: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}