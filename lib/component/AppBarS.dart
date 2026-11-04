import 'package:flutter/material.dart';

class AppBarS extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final List<Widget>? actions;

  const AppBarS({
    super.key,
    this.title = "Steam",
    this.showBackButton = true,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    const steamDarkBg = Color(0xFF171D25);
    const steamAccentBlue = Color(0xFF66C0F4);

    return AppBar(
      backgroundColor: steamDarkBg,
      elevation: 4,
      shadowColor: Colors.black.withOpacity(0.5),
      centerTitle: true,
      automaticallyImplyLeading: showBackButton,
      iconTheme: const IconThemeData(
        color: steamAccentBlue,
      ),
      title: Text(
        title.toUpperCase(),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w800,
          letterSpacing: 2.0,
        ),
      ),
      actions: actions,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(2.0),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF00ADEE),
                Color(0xFF1976D2),
                Color(0xFF171D25),
              ],
            ),
          ),
          height: 2.0, // Line gradasi aksen Steam di bawah header
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 2.0);
}