import 'package:design_ex/view/shop/model/product_model.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ProductController extends GetxController with StateMixin<List?> {
  List<ProductModel>? products;

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
}
