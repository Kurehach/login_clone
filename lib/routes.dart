import 'package:login_clone/pages/confirm_registration_pages.dart';
import 'package:login_clone/pages/registration_pages.dart';
import 'package:login_clone/model/list_product_pages.dart';
import 'package:login_clone/model/detail_pages.dart';
import 'package:get/get.dart';

class Routes {
  static const String registration = "/registration";
  static const String confirmRegistration = "/confirmRegistration";
  static const String detail = "/detail";
  static const String listProduct = "/listProduct";

  static final myPages = [
    GetPage(name: registration, page: () => RegistrationPages()),
    GetPage(name: confirmRegistration, page: () => ConfirmRegistrationPages()),
    GetPage(name: detail, page: () => DetailPages()),
    GetPage(name: listProduct, page: () => ListProductPages()),
  ];
}