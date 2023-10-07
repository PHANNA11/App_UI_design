import 'package:design_ex/view/management/view/home_mangement.dart';
import 'package:design_ex/view/profile/view/profile_screen.dart';
import 'package:design_ex/view/shop/view/shop_scren.dart';
import 'package:design_ex/widget/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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
            title: 'Profile Screen',
            callRoute: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(),
                  ));
            },
          ),
          MenuWidget(
            title: 'Shop Screen',
            callRoute: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShopScreen(),
                  ));
            },
          ),
          MenuWidget(
            title: 'Management App',
            callRoute: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeManagementScreen(),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
