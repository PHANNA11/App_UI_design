import 'dart:ffi';

import 'package:design_ex/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class CartSettingWidget extends StatelessWidget {
  CartSettingWidget({super.key});
  List<Map<String, dynamic>> listItem = [
    {
      'label': 'Light / Dark',
      'value': themeController.isDark,
      'function': themeController.changeTheme
    },
    {'label': 'ខ្មែរ / english', 'value': false, 'function': (val) {}}
  ];
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          children: List.generate(
            listItem.length,
            (index) => Column(
              children: [
                subWidget(
                    title: listItem[index]['label'],
                    valuecheck: listItem[index]['value'],
                    onChanged: listItem[index]['function']),
                if (index < listItem.length - 1)
                  const Divider(
                    color: Colors.black,
                    height: 2,
                  ),
              ],
            ),
          ),
        ));
  }

  Widget subWidget(
      {String? title, bool? valuecheck, void Function(bool)? onChanged}) {
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
                  color: Colors.black),
            ),
            CupertinoSwitch(
              value: valuecheck!,
              onChanged: onChanged,
            )
          ],
        );
      }),
    );
  }
}
