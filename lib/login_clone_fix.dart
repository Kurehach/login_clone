import 'package:flutter/material.dart';
import 'component/custom_app_bar.dart';
import 'component/header_logo.dart';
import 'component/instruction_text.dart';
import 'component/custom_text_field.dart';
import 'component/custom_button.dart';

class LoginCloneFix extends StatelessWidget {
  const LoginCloneFix({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF25D366);
    const textColor = Color.fromARGB(255, 135, 135, 135);

    return Scaffold(
      backgroundColor: const Color(0xFF111B21),
      appBar: const CustomAppBar(
        title: "WhatsApp",
        backgroundColor: Color(0xFF202C33),
        titleStyle: TextStyle(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            const HeaderLogo(
              icon: Icons.chat,
              size: 80,
              color: primaryColor,
            ),
            const SizedBox(height: 20),
            InstructionText(
              title: "Enter your phone number",
              subtitle:
                  "Whatsapp will need to verify your phone number.\nCarrier charge may apply.",
              linkText: "What's my phone number?",
              titleStyle: const TextStyle(
                color: textColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              subtitleStyle: const TextStyle(
                color: textColor,
                fontSize: 16,
              ),
              linkStyle: const TextStyle(
                color: primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              onLinkTap: () {},
            ),
            const SizedBox(height: 30),
            const CustomTextField(
              hintText: "Input Phone Number",
              style: TextStyle(color: Colors.white),
              hintStyle: TextStyle(color: Colors.grey),
              borderColor: Colors.grey,
              focusedBorderColor: primaryColor,
            ),
            const SizedBox(height: 30),
            CustomButton(
              text: "Next",
              backgroundColor: primaryColor,
              textStyle: const TextStyle(color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}