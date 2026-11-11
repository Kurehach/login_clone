import 'package:login_clone/model/data_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ListProductController extends GetxController {
  var isLoading = true.obs;
  var listProduct = <DataModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    try {
      isLoading.value = true;
      final url = Uri.parse("https://www.freetogame.com/api/games");
      
      final response = await http.get(url).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw Exception("Koneksi timeout, periksa internet kamu");
        },
      );

      if (response.statusCode == 200) {
        var data = dataModelFromJson(response.body);
        listProduct.assignAll(data);
      } else {
        Get.snackbar("Error", "Gagal mengambil data (${response.statusCode})");
      }
    } catch (e) {
      Get.snackbar("Gagal", e.toString());
      print("Error Fetching Data: $e");
    } finally {
      isLoading.value = false;
    }
  }
}