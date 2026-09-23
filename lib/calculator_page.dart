import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_clone/controller/calculator_controller.dart';
import 'package:login_clone/component/text_field.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final controller = Get.put(CalculatorController());
  late final TextEditingController txtangka1;
  late final TextEditingController txtangka2;

  @override
  void initState() {
    super.initState();
    txtangka1 = TextEditingController();
    txtangka2 = TextEditingController();
  }

  @override
  void dispose() {
    txtangka1.dispose();
    txtangka2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color.fromRGBO(18, 18, 18, 1);
    const cardColor = Color.fromRGBO(30, 30, 36, 1);
    const goldPrimary = Color.fromRGBO(212, 175, 55, 1);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text(
          "K A L K U L A T O R",
          style: TextStyle(
            color: goldPrimary,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: 2.5,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 12),
            
            // Input Fields
            Textfield(
              myHint: "input angka 1",
              txtController: txtangka1,
              radius: 12,
            ),
            const SizedBox(height: 16),
            Textfield(
              myHint: "input angka 2",
              txtController: txtangka2,
              radius: 12,
            ),
            const SizedBox(height: 28),

            // Barisan Tombol Operasi Hitung
            Row(
              children: [
                Expanded(
                  child: _buildOperationButton(
                    label: "Tambah",
                    onTap: () {
                      final angka = _parseInputs();
                      if (angka == null) return;
                      controller.tambah(angka[0], angka[1]);
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildOperationButton(
                    label: "Kurang",
                    onTap: () {
                      final angka = _parseInputs();
                      if (angka == null) return;
                      controller.kurang(angka[0], angka[1]);
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildOperationButton(
                    label: "Kali",
                    onTap: () {
                      final angka = _parseInputs();
                      if (angka == null) return;
                      controller.kali(angka[0], angka[1]);
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildOperationButton(
                    label: "Bagi",
                    onTap: () {
                      final angka = _parseInputs();
                      if (angka == null) return;
                      controller.bagi(angka[0], angka[1]);
                    },
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 32),

            Container(
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: goldPrimary.withOpacity(0.3)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    "HASIL",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 12,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Obx(
                    () => Text(
                      controller.hasilHitung.toString(),
                      style: const TextStyle(
                        color: goldPrimary,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<double>? _parseInputs() {
    final input1 = txtangka1.text.trim();
    final input2 = txtangka2.text.trim();
    final a1 = double.tryParse(input1);
    final a2 = double.tryParse(input2);

    if (input1.isEmpty || input2.isEmpty || a1 == null || a2 == null) {
      Get.snackbar(
        "Error",
        "Masukkan angka yang valid",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFF1E1E24),
        colorText: const Color(0xFFD4AF37),
      );
      return null;
    }

    return [a1, a2];
  }

  Widget _buildOperationButton({required String label, required VoidCallback onTap}) {
    const goldPrimary = Color(0xFFD4AF37);
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: goldPrimary,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }
}