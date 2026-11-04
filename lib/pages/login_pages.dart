import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_clone/controller/login_controller.dart';
import 'package:login_clone/component/login_button.dart';
import 'package:login_clone/component/text_field.dart';
import 'package:login_clone/component/AppBarS.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    // Palette Warna Background Steam
    const steamBgDark = Color(0xFF1B2838);
    const steamBgGradient = Color(0xFF171D25);
    const steamLinkColor = Color(0xFF8F98A0);

    return Scaffold(
      backgroundColor: steamBgDark,
      appBar: const AppBarS(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [steamBgDark, steamBgGradient],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title Header Kecil khas Login Form Steam
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                    child: Text(
                      "SIGN IN WITH ACCOUNT NAME",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Field Username
                  TextfieldS(
                    labelText: "Account Name",
                    txtController: controller.txtUsername,
                  ),

                  const SizedBox(height: 8),

                  // Field Password
                  TextfieldS(
                    labelText: "Password",
                    txtController: controller.txtPassword,
                    obscureText: true,
                  ),

                  const SizedBox(height: 4),

                  const SizedBox(height: 12),

                  // Tombol Sign In & Indikator Loading
                  Obx(
                    () => controller.isLoading.value
                        ? const Center(
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Color(0xFF66C0F4),
                                ),
                              ),
                            ),
                          )
                        : LoginButton(
                            text: "SIGN IN",
                            onPressed: () {
                              controller.login();
                            },
                          ),
                  ),

                  const SizedBox(height: 16),

                  // Link Bantuan khas Steam
                  Center(
                    child: TextButton(
                      onPressed: () {
                        // Action bantuan login jika diperlukan
                      },
                      child: const Text(
                        "Help, I can't sign in",
                        style: TextStyle(
                          color: steamLinkColor,
                          fontSize: 13,
                          decoration: TextDecoration.underline,
                          decorationColor: steamLinkColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}