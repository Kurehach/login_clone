import 'package:flutter/material.dart';

class SteamCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final String label;

  const SteamCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.label = "Remember me",
  });

  @override
  Widget build(BuildContext context) {
    const steamInputBg = Color(0xFF182330);
    const steamBorderColor = Color(0xFF2A3F5A);
    const steamFocusBlue = Color(0xFF66C0F4);
    const steamLabelColor = Color(0xFF8F98A0);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
      child: InkWell(
        onTap: () => onChanged(!value),
        borderRadius: BorderRadius.circular(4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 20,
              width: 20,
              child: Checkbox(
                value: value,
                onChanged: onChanged,
                activeColor: steamFocusBlue,
                checkColor: Colors.black, // Centang kontras warna hitam/biru tua
                fillColor: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.selected)) {
                    return steamFocusBlue;
                  }
                  return steamInputBg;
                }),
                side: const BorderSide(
                  color: steamBorderColor,
                  width: 1.5,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3), // Border membulat halus khas Steam
                ),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              label,
              style: const TextStyle(
                color: steamLabelColor,
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}