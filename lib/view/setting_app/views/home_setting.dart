import 'package:design_ex/main.dart';
import 'package:design_ex/view/setting_app/widget/cart_setting_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomeSettingApp extends StatelessWidget {
  const HomeSettingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Setting'),
        ),
        body: Column(
          children: [
            Flexible(
              child: CartSettingWidget(),
            ),
            const SizedBox(
              height: 20,
            ),
            Flexible(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Khmer OS',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(
                                Icons.done,
                                color: Colors.blue,
                              )
                            ],
                          ),
                        ),
                    separatorBuilder: (context, index) => const Divider(
                          height: 2,
                          color: Colors.black,
                        ),
                    itemCount: 3),
              ),
            ),
          ],
        ));
  }
}
