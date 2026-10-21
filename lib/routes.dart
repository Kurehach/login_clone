import 'package:login_clone/pages/confirm_registration_pages.dart';
import 'package:login_clone/pages/registration_pages.dart';
import 'package:login_clone/pages/list_product_pages.dart';
import 'package:login_clone/pages/detail_pages.dart';
import 'package:login_clone/pages/main_menu_pages.dart';
import 'package:get/get.dart';

class Routes {
  static const String registration = "/registration";
  static const String confirmRegistration = "/confirmRegistration";
  static const String mainMenuPages = "/mainMenuPages";
  static const String detailProduct = "/detailProduct";
  static const String listProduct = "/listProduct";

  static final myPages = [
    GetPage(name: registration, page: () => RegistrationPages()),
    GetPage(name: confirmRegistration, page: () => ConfirmRegistrationPages()),
    GetPage(name: mainMenuPages, page: () => MainMenuPages()),
    GetPage(name: detailProduct, page: () => DetailPages()),
    GetPage(name: listProduct, page: () => ListProductPages()),
  ];
}