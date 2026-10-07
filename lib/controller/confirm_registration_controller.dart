import 'package:get/get.dart';

class ConfirmRegistrationController extends GetxController {
  late String nama;
  late String jenisKelamin;
  late String alamat;
  late String noWa;
  late String email;

  @override
  void onInit() {
    super.onInit();

    final arguments = Get.arguments;

    nama = arguments['name'];
    jenisKelamin = arguments['jenis_kelamin'];
    alamat = arguments['alamat'];
    noWa = arguments['no_wa'];
    email = arguments['email'];
  }
}