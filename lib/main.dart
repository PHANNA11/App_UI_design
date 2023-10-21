import 'package:design_ex/view/home_screen.dart';
import 'package:design_ex/view/setting_app/controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

final themeController = Get.put(ThemeModeController());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleBuilder(builder: (context) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeController.theme,
        home: const HomeScreen(),
      );
    });
  }
}
