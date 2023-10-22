import 'dart:developer';

import 'package:design_ex/enum/shop_enum.dart';
import 'package:design_ex/view/shop/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ProductController extends GetxController with StateMixin<List?> {
  List<ProductModel>? products;
  RxMap<String, dynamic>? sort =
      <String, dynamic>{'value': '', "label": 'Sort'}.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    change([], status: RxStatus.success());
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    getProduct();
  }

  Future getProduct() async {
    if (status.isLoadingMore) return;
    if (!status.isLoadingMore && value!.isNotEmpty) {
      change(value!, status: RxStatus.loadingMore());
    } else {
      change([], status: RxStatus.loading());
    }
    if (productList.isNotEmpty) {
      value!.addAll(productList);
    }
    await Future.delayed(const Duration(seconds: 3));

    return change(value, status: RxStatus.success());
  }

  sortProduct() async {
    change(value!, status: RxStatus.loadingMore());
    switch (sort!['value']) {
      case 'discount':
        //  value!.assignAll([]);
        break;
      case 'lower_to_upper_price':
        value!.sort((a, b) => a.price.compareTo(b.price));
        for (var temp in value!.toList()) {
          temp as ProductModel;
          log(temp.price.toString());
        }
        break;
      case 'upper_to_lower_price':
        value!.sort((a, b) => b.price.compareTo(a.price));
        for (var temp in value!.toList()) {
          temp as ProductModel;
          log(temp.price.toString());
        }
        break;
      case 'best_selling':
        //  value!.assignAll([]);
        break;
    }
    change(value, status: RxStatus.success());
    update();
  }
}
