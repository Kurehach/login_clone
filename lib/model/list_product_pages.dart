import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_clone/model/list_product_controller.dart';
import 'package:login_clone/model/detail_pages.dart';
import 'package:login_clone/routes.dart';

class ListProductPages extends StatelessWidget {
  const ListProductPages({super.key});

  @override
  Widget build(BuildContext context) {
    final ListProdukController controller = Get.put(ListProdukController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Produk"),
        backgroundColor: Colors.greenAccent,
      ),
      body: ListView.builder(
        itemCount: controller.listProduk.length > 5 ? 5 : controller.listProduk.length,
        itemBuilder: (context, index) {
          final produk = controller.listProduk[index];

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: ListTile(
              // Gambar di bagian kiri list
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: _buildImage(produk.gambar),
                ),
              ),
              title: Text(
                produk.nama,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                produk.deskripsi,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Get.toNamed(Routes.detail, arguments: produk);
              },
            ),
          );
        },
      ),
    );
  }

  // Helper fungsi gambar biar aman dari base64/network error
  static Widget _buildImage(String imageSrc) {
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

  static Widget _buildPlaceholder() {
    return Container(
      color: Colors.grey.shade200,
      child: const Icon(Icons.image_not_supported, color: Colors.grey),
    );
  }
}