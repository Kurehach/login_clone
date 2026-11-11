import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_clone/model/data_model.dart'; // Import DataModel baru

class DetailPages extends StatelessWidget {
  const DetailPages({super.key});

  final Color cardColor = const Color.fromRGBO(23, 32, 48, 1);
  final Color backgroundColor = const Color.fromRGBO(16, 24, 36, 1);

  @override
  Widget build(BuildContext context) {
    // Ambil arguments sebagai DataModel
    final DataModel game = Get.arguments as DataModel;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          game.title ?? "Detail Game",
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: cardColor,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thumbnail Image Banner
            if (game.thumbnail != null && game.thumbnail!.isNotEmpty)
              Image.network(
                game.thumbnail!,
                width: double.infinity,
                height: 220,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 200,
                  color: cardColor,
                  child: const Center(
                    child: Icon(Icons.broken_image, color: Colors.white54, size: 50),
                  ),
                ),
              ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Publisher / Vendor Information
                  Row(
                    children: [
                      const Icon(Icons.business, size: 18, color: Colors.white54),
                      const SizedBox(width: 6),
                      Text(
                        game.publisher ?? "Unknown Publisher",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Game Title
                  Text(
                    game.title ?? "-",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Genre Badge
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.greenAccent.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: Colors.greenAccent),
                    ),
                    child: Text(
                      game.genre ?? "Free",
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.greenAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Platform Tag
                  Row(
                    children: [
                      const Icon(Icons.devices, color: Colors.amber, size: 20),
                      const SizedBox(width: 6),
                      Text(
                        game.platform.toString(),
                        style: const TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 30, color: Colors.white24),

                  // Game Description Header
                  const Text(
                    "Deskripsi Game",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Short Description Content
                  Text(
                    game.shortDescription ?? "Tidak ada deskripsi tersedia.",
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      color: Colors.white70,
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
}