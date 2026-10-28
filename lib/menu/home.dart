
import 'package:login_clone/controller/list_product_controller.dart';
import 'package:login_clone/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          child: GridView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(10),
            itemCount: controller.listProduk.length,
            gridDelegate:
                const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 220,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              mainAxisExtent: 125,
            ),
            itemBuilder: (context, index) {
              final produk = controller.listProduk[index];

              return Dismissible(
                key: ValueKey(produk.nama),
                direction: DismissDirection.startToEnd,
                background: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 15),
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
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            produk.harga,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Align(
                            alignment: Alignment.bottomRight,
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white70,
                              size: 15,
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
    );
  }
}