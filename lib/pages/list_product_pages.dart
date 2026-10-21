import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_clone/controller/list_product_controller.dart';
import 'package:login_clone/model/produk_model.dart';
import 'package:login_clone/routes.dart';

class ListProductPages extends StatelessWidget {
  const ListProductPages({super.key});

  @override
  Widget build(BuildContext context) {
    final ListProdukController controller = Get.put(ListProdukController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Produk"),
        backgroundColor: Colors.green,
      ),
      // Gunanya ListView.builder untuk scrolling list
      body: ListView.builder(
        itemCount: controller.listProduk.length > 5 ? 5 : controller.listProduk.length,
        itemBuilder: (context, index) {
          final produk = controller.listProduk[index];
          // Panggil Reusable Component Widget
          return _buildProductItem(produk);
        },
      ),
    );
  }

  // REUSABLE COMPONENT WIDGET (3. Reusable Component)
  Widget _buildProductItem(ProdukModel produk) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: ListTile(
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
          // 2. Menggunakan Static Route Get.toNamed('/detailList') dengan argument
          Get.toNamed(Routes.detailProduct, arguments: produk);
        },
      ),
    );
  }
}