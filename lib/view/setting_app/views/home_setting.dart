import 'package:design_ex/main.dart';
import 'package:design_ex/view/setting_app/widget/cart_setting_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class HomeSettingApp extends StatelessWidget {
  const HomeSettingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleBuilder(builder: (context) {
      return Scaffold(
          appBar: AppBar(
            title: const Text('Setting'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CartSettingWidget(),
                const SizedBox(
                  height: 20,
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Flexible(
                      child: Column(
                    children: List.generate(
                      3,
                      (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Khmer OS',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                CircleAvatar(
                                  maxRadius: 15,
                                  child: Icon(
                                    Icons.done,
                                  ),
                                )
                              ],
                            ),
                            if (index != 2)
                              const Divider(
                                color: Colors.grey,
                                thickness: 1,
                              )
                          ],
                        ),
                      ),
                    ),
                  )),
                ),
              ],
            ),
          ));
    });
  }
}
