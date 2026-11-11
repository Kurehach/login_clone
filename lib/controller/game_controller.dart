import 'package:login_clone/model/data_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ListProductController extends GetxController {
  var isLoading = true.obs;
  var listProduct = <DataModel>[].obs; // Menggunakan DataModel

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    try {
      isLoading.value = true;
      final url = Uri.parse("https://www.freetogame.com/api/games");
      final response = await http.get(url);

      if (response.statusCode == 200) {
        var data = dataModelFromJson(response.body);
        listProduct.assignAll(data);
      } else {
        Get.snackbar("Error", "Gagal mengambil data dari server");
      }
    } catch (e) {
        Get.snackbar("gagal", e.toString());
        print("error nya "+e.toString());
      }
  }
}