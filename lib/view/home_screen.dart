import 'package:design_ex/view/management/view/home_mangement.dart';
import 'package:design_ex/view/profile/view/profile_screen.dart';
import 'package:design_ex/view/setting_app/views/home_setting.dart';
import 'package:design_ex/view/shop/view/shop_scren.dart';
import 'package:design_ex/widget/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Screen'),
      ),
      body: Column(
        children: [
          MenuWidget(
            title: 'profile'.tr,
            callRoute: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ));
            },
            imageIcons: 'assets/icons/software-engineer.png',
          ),
          MenuWidget(
            title: 'shop'.tr,
            callRoute: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShopScreen(),
                  ));
            },
            imageIcons: 'assets/icons/store.png',
          ),
          MenuWidget(
            title: 'management'.tr,
            callRoute: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeManagementScreen(),
                  ));
            },
            imageIcons: 'assets/icons/management.png',
          ),
          MenuWidget(
            title: 'setting'.tr,
            callRoute: () {
              Get.to(() => HomeSettingApp());
            },
            imageIcons: 'assets/icons/settings.png',
          ),
        ],
      ),
    );
  }
}
