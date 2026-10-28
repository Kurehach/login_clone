import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_clone/controller/menu_drawer_controller.dart';

class MenuDrawerPages extends StatelessWidget {
  const MenuDrawerPages({super.key});

  @override
  Widget build(BuildContext context) {
    final MenuDrawerController drawerController = Get.find<MenuDrawerController>();

    return Drawer(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Header Drawer bertema E-Commerce
            DrawerHeader(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.green, Color(0xFF2E7D32)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 32, color: Colors.green),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Moammar Ataturk",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    "Gold Member • Store VIP",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),

            // Menu Pilihan menggunakan Obx agar reaktif
            Obx(() => Column(
                  children: [
                    _buildItem(
                      icon: Icons.home_rounded,
                      title: "Home / Katalog",
                      index: 0,
                      controller: drawerController,
                      context: context,
                    ),
                    _buildItem(
                      icon: Icons.history_rounded,
                      title: "Riwayat Transaksi",
                      index: 1,
                      controller: drawerController,
                      context: context,
                    ),
                    _buildItem(
                      icon: Icons.person_rounded,
                      title: "Profil Akun",
                      index: 2,
                      controller: drawerController,
                      context: context,
                    ),
                  ],
                )),

            const Divider(height: 30, thickness: 1, indent: 16, endIndent: 16),
            
            ListTile(
              leading: const Icon(Icons.logout_rounded, color: Colors.red),
              title: const Text(
                "Keluar",
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              onTap: () {
                Navigator.pop(context);
                Get.snackbar(
                  "Keluar",
                  "Berhasil keluar dari akun",
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                  margin: const EdgeInsets.all(12),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem({
    required IconData icon,
    required String title,
    required int index,
    required MenuDrawerController controller,
    required BuildContext context,
  }) {
    final isSelected = controller.selectedIndex.value == index;

    return ListTile(
      leading: Icon(
        icon,
        color: isSelected ? Colors.green : Colors.grey.shade600,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.green : Colors.grey.shade800,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
        ),
      ),
      selected: isSelected,
      selectedTileColor: Colors.green.shade50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      onTap: () {
        controller.changePageIndex(index);
        Navigator.pop(context); // Tutup drawer otomatis saat diklik
      },
    );
  }
}