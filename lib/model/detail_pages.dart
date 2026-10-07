import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_clone/model/produk_model.dart';

class DetailPages extends StatelessWidget {
  const DetailPages({super.key});

  @override
  Widget build(BuildContext context) {
    // FITUR PENTING: Mengambil arguments yang dikirim dari halaman sebelumnya
    final ProdukModel produk = Get.arguments as ProdukModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(produk.nama),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar Produk
            SizedBox(
              height: 250,
              width: double.infinity,
              child: _buildImage(produk.gambar),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Toko
                  Row(
                    children: [
                      const Icon(Icons.store, size: 18, color: Colors.grey),
                      const SizedBox(width: 6),
                      Text(
                        produk.toko,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Nama Produk
                  Text(
                    produk.nama,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Harga
                  Text(
                    produk.harga,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Rating & Review
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                      const SizedBox(width: 4),
                      Text(
                        "${produk.rating} / 5",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "(${produk.review} ulasan)",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),

                  const Divider(height: 30, thickness: 1),

                  // Deskripsi
                  const Text(
                    "Deskripsi Produk",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    produk.deskripsi,
                    style: const TextStyle(fontSize: 14, height: 1.5),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(String imageSrc) {
    if (imageSrc.startsWith("data:image") || imageSrc.startsWith("base64,")) {
      try {
        final cleanBase64 = imageSrc.contains(",") ? imageSrc.split(",").last : imageSrc;
        return Image.memory(
          base64Decode(cleanBase64),
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => _buildPlaceholder(),
        );
      } catch (_) {
        return _buildPlaceholder();
      }
    }

    return Image.network(
      imageSrc,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) => _buildPlaceholder(),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      color: Colors.grey.shade200,
      child: const Center(
        child: Icon(Icons.image_not_supported, color: Colors.grey, size: 40),
      ),
    );
  }
}