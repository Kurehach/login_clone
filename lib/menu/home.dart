import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_clone/controller/list_product_controller.dart';
import 'package:login_clone/routes.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final ListProdukController controller =
      Get.isRegistered<ListProdukController>()
          ? Get.find<ListProdukController>()
          : Get.put(ListProdukController());

  final Color cardColor = const Color.fromRGBO(23, 32, 48, 1);

  // Membuka halaman detail produk
  void bukaDetail(dynamic produk) {
    Get.toNamed(
      Routes.detailProduct,
      arguments: produk,
    );
  }

  // Menghapus produk
  void hapusProduk(int index) {
    final produk = controller.listProduk[index];

    controller.listProduk.removeAt(index);

    Get.snackbar(
      "Produk Dihapus",
      "${produk.nama} berhasil dihapus",
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // Refresh daftar produk
  Future<void> refreshProduk() async {
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: cardColor,
        foregroundColor: Colors.white,
      ),
      body: Obx(
        () => RefreshIndicator(
          onRefresh: refreshProduk,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Katalog Produk Pilihan",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // SizedBox dengan tinggi tetap & Directionality RTL (Kanan ke Kiri)
                  SizedBox(
                    height: 200,
                    child: Directionality(
                      textDirection: TextDirection.rtl, // Scroll dari kanan ke kiri
                      child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemCount: controller.listProduk.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisExtent: 160, // Lebar card horizontal
                          mainAxisSpacing: 12,
                        ),
                        itemBuilder: (context, index) {
                          final produk = controller.listProduk[index];

                          return Dismissible(
                            key: ValueKey(produk.nama + index.toString()),
                            direction: DismissDirection.down,
                            background: Container(
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              alignment: Alignment.center,
                              child: const Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ),
                            onDismissed: (direction) {
                              hapusProduk(index);
                            },
                            child: Card(
                              color: cardColor,
                              margin: EdgeInsets.zero,
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: InkWell(
                                onTap: () => bukaDetail(produk),
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        produk.nama,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        produk.harga,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: Colors.greenAccent,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      const Align(
                                        alignment: Alignment.bottomRight,
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.white70,
                                          size: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
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