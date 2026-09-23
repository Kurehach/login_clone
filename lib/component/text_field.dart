import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Textfield extends StatelessWidget {
  final String myHint;
  final TextEditingController txtController;
  final double radius;

  const Textfield({
    super.key,
    required this.myHint,
    required this.txtController,
    this.radius = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    const goldPrimary = Color(0xFFD4AF37);
    const inputFillColor = Color(0xFF1E1E24);

    return TextField(
      controller: txtController,
      // Membuka keyboard angka di HP
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      // Memblokir semua karakter selain angka dan titik desimal
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
      ],
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      cursorColor: goldPrimary,
      decoration: InputDecoration(
        hintText: myHint,
        hintStyle: TextStyle(
          color: Colors.white.withOpacity(0.35),
          fontSize: 15,
        ),
        filled: true,
        fillColor: inputFillColor,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(
            color: Colors.white.withOpacity(0.15),
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: const BorderSide(
            color: goldPrimary,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}