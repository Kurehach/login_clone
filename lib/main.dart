import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_clone_fix.dart';
import 'routes.dart';
import 'calculator_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Belajar Flutter PPLG 3",
      initialRoute: Routes.listProduct,
      getPages: Routes.myPages,
    );
  }
}