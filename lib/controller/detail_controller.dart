import 'package:login_clone/model/produk_model.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  late ProdukModel produk;

  @override
  void onInit() {
    super.onInit();

    produk = Get.arguments;
  }
}