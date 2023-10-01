import 'package:design_ex/view/shop/model/product_model.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ShoppingCartController extends GetxController {
  RxList<ProductModel> productList = <ProductModel>[].obs;
  RxInt countTempQty = 1.obs;
  void countQtyUp() async {
    countTempQty++;
    update();
  }

  void countQtyDown() async {
    countTempQty--;
    update();
  }

  void addToCart({required ProductModel? product}) async {
    if (productList.isEmpty) {
      productList.add(product!);
    } else {
      int selectIndex =
          productList.indexWhere((element) => element.id == product!.id);
      if (selectIndex > -1) {
        productList[selectIndex].qty + 1;
        update();
        incrementQty(product: product);
      } else {
        productList.add(product!);
      }
    }

    update();
  }

  void removeFromCart({required ProductModel? product}) async {
    int selectIndex =
        productList.indexWhere((element) => element.id == product!.id);
    productList.removeAt(selectIndex);
    update();
  }

  void decrementQty({required ProductModel? product}) async {
    int selectIndex =
        productList.indexWhere((element) => element.id == product!.id);
    if (selectIndex > -1) {
      if (productList[selectIndex].qty > 1) {
        productList[selectIndex].qty--;
        update();
      } else {
        productList.removeAt(selectIndex);
        update();
      }
    }

    update();
  }

  void incrementQty({required ProductModel? product}) async {
    int selectIndex =
        productList.indexWhere((element) => element.id == product!.id);
    productList[selectIndex].qty++;
    update();
  }
}
