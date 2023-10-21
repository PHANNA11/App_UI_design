import 'dart:developer';

import 'package:design_ex/enum/shop_enum.dart';
import 'package:design_ex/view/shop/controller/product_controller.dart';
import 'package:design_ex/widget/custom_filter_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

List<Map<String, dynamic>> itemSort = [
  {
    'label': EnumProductSort.discount.display,
    'value': EnumProductSort.discount.value
  },
  {
    'label': EnumProductSort.bestSelling.display,
    'value': EnumProductSort.bestSelling.value
  },
  {
    'label': EnumProductSort.lowerToUpperPrice.display,
    'value': EnumProductSort.lowerToUpperPrice.value
  },
  {
    'label': EnumProductSort.upperToLowerPrice.display,
    'value': EnumProductSort.upperToLowerPrice.value
  },
  {
    'label': EnumProductSort.sortByName.display,
    'value': EnumProductSort.sortByName.value
  },
];

class MyProductFilter extends StatelessWidget {
  MyProductFilter({super.key});
  final productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter Product'),
      ),
      body: GetBuilder<ProductController>(
          init: productController,
          builder: (context) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomFilterButton(
                  onTap: () async {
                    Get.bottomSheet(
                      isScrollControlled: true,
                      StatefulBuilder(
                        builder: (context, setState) => Container(
                            height: 400,
                            color: Colors.white,
                            child: Obx(
                              () => Column(
                                children: List.generate(
                                  itemSort.length,
                                  (index) => Card(
                                    elevation: 0,
                                    color: productController.sort!['value'] ==
                                            itemSort[index]['value']
                                        ? const Color.fromARGB(
                                            255, 234, 217, 222)
                                        : null,
                                    child: ListTile(
                                      onTap: () async {
                                        productController.sort!['value'] =
                                            itemSort[index]['value'];
                                        productController.update();
                                        productController.sort!['label'] =
                                            itemSort[index]['label'];
                                        productController.update();
                                        productController.refresh();
                                      },
                                      title: Text(itemSort[index]['label']),
                                    ),
                                  ),
                                ),
                              ),
                            )),
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CupertinoButton(
                          color: Colors.red,
                          child: const Text('Cancel'),
                          onPressed: () {}),
                      CupertinoButton(
                          color: Colors.blue,
                          child: const Text('Filter'),
                          onPressed: () async {
                            productController.sortProduct().then((value) {
                              productController.refresh();
                              Get.back();
                            });
                          })
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }
}
