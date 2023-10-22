import 'package:design_ex/main.dart';
import 'package:design_ex/view/setting_app/controller/font_controller.dart';
import 'package:design_ex/view/setting_app/widget/cart_setting_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class HomeSettingApp extends StatelessWidget {
  HomeSettingApp({super.key});

  final fontController = Get.put(FontController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FontController>(builder: (contexts) {
      return SimpleBuilder(builder: (contextsb) {
        return Scaffold(
            appBar: AppBar(
              title: Text(
                'setting'.tr,
                style:
                    TextStyle(fontFamily: fontController.fontTheme.toString()),
              ),
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
                        fontController.listFont.length,
                        (index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              fontController.changeFontThem(
                                  fontController.listFont[index].obs);
                            },
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      fontController.listFont[index],
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontFamily: fontController.fontTheme
                                              .toString()),
                                    ),
                                    if (fontController.listFont[index] ==
                                        fontController.fontTheme.value)
                                      const CircleAvatar(
                                        maxRadius: 15,
                                        child: Icon(
                                          Icons.done,
                                        ),
                                      )
                                  ],
                                ),
                                if (index != fontController.listFont.length - 1)
                                  const Divider(
                                    color: Colors.grey,
                                    thickness: 1,
                                  )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )),
                  ),
                ],
              ),
            ));
      });
    });
  }
}
