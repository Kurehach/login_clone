import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_clone/model/produk_model.dart';

class DetailPages extends StatelessWidget {
  const DetailPages({super.key});

  @override
  Widget build(BuildContext context) {
    final ProdukModel produk = Get.arguments as ProdukModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(produk.nama),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.store, size: 18, color: Colors.grey),
                const SizedBox(width: 6),
                Text(
                  produk.toko,
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade700, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              produk.nama,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              produk.harga,
              style: const TextStyle(fontSize: 20, color: Colors.green, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 20),
                const SizedBox(width: 4),
                Text("${produk.rating} / 5", style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(width: 10),
                Text("(${produk.review} ulasan)", style: TextStyle(color: Colors.grey.shade600)),
              ],
            ),
            const Divider(height: 30),
            const Text("Deskripsi Produk", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(produk.deskripsi, style: const TextStyle(fontSize: 14, height: 1.5)),
          ],
        ),
      ),
    );
  }
}