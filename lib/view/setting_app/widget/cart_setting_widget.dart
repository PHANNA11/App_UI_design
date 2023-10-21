import 'package:design_ex/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class CartSettingWidget extends StatelessWidget {
  CartSettingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        // boxShadow: [BoxShadow(color: Colors.white, blurRadius: 2)]),
        child: Column(
          children: [
            subWidget(
              title: 'Dark / Light',
            ),
            const Divider(
              color: Colors.black,
              height: 2,
            ),
            subWidget(title: 'ខ្មែរ / English')
          ],
        ));
  }

  Widget subWidget({String? title}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SimpleBuilder(builder: (context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title.toString(),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            CupertinoSwitch(
              value: themeController.isDark,
              onChanged: themeController.changeTheme,
            )
          ],
        );
      }),
    );
  }
}
