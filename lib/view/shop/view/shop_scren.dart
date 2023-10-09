import 'dart:developer';

import 'package:design_ex/view/shop/controller/product_controller.dart';
import 'package:design_ex/view/shop/controller/shopping_cart_controller.dart';
import 'package:design_ex/view/shop/model/product_model.dart';
import 'package:design_ex/view/shop/view/cart_screen.dart';
import 'package:design_ex/view/shop/view/detail_product_screen.dart';
import 'package:design_ex/view/shop/view/filter_screen.dart';
import 'package:design_ex/widget/shop_shrimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:badges/badges.dart' as badges;
import 'package:get/get.dart';

class ShopScreen extends StatelessWidget {
  ShopScreen({super.key});

  final searchController = TextEditingController();

  List<ProductModel>? filterList = [];
  final cartController = Get.put(ShoppingCartController());
  final productController = Get.put(ProductController());
  RxBool isGridView = true.obs;
  RxBool showEndDrawer = false.obs;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShoppingCartController>(
        init: cartController,
        builder: (contexts) {
          return Scaffold(
            drawer: const Drawer(),
            // endDrawer:
            //     showEndDrawer.value == true ? const Drawer() : SizedBox(),
            appBar: AppBar(
              centerTitle: true,
              title: const Text('E-Shop'),
              actions: [
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => CartScreen());
                    },
                    child: badges.Badge(
                      showBadge:
                          cartController.productList.isEmpty ? false : true,
                      badgeContent:
                          Text(cartController.productList.length.toString()),
                      child: const Icon(
                        Icons.shopping_cart,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                )
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: searchController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.search),
                          hintText: 'search product'),
                      onChanged: (value) {
                        filterList = productList
                            .where((pro) => pro.name
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                            .toList();
                        cartController.refresh();
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            'Popular Products',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () async {
                                  isGridView.value = !isGridView.value;
                                  // ignore: invalid_use_of_protected_member
                                  cartController.refresh();
                                },
                                child: const Icon(
                                  Icons.menu_outlined,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () async {
                                  showEndDrawer.value = !showEndDrawer.value;
                                  // ignore: invalid_use_of_protected_member
                                  cartController.refresh();
                                },
                                child: GestureDetector(
                                  onTap: () => Get.to(() => MyProductFilter()),
                                  child: const Icon(
                                    Icons.filter_list,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    productController.obx((state) {
                      return Wrap(
                        children: List.generate(
                            searchController.text.isEmpty || filterList!.isEmpty
                                ? state!.length
                                : filterList!.length,
                            (index) => isGridView.value
                                ? productCard(
                                    pro: searchController.text.isEmpty ||
                                            filterList!.isEmpty
                                        ? state![index]
                                        : filterList![index])
                                : singleProductCard(
                                    pro: searchController.text.isEmpty ||
                                            filterList!.isEmpty
                                        ? state![index]
                                        : filterList![index])),
                      );
                    },
                        onLoading: ShopWidget().shimmerGridProductCart(),
                        onEmpty: Column(
                          children: const [
                            Icon(
                              Icons.shopping_cart_sharp,
                              size: 80,
                            ),
                            Text(' No Product here')
                          ],
                        ))
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget singleProductCard({ProductModel? pro}) => Stack(children: [
        GestureDetector(
          onTap: () {
            Get.to(() => DetailProductScreen(pro: pro));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Hero(
                    tag: pro!.id,
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blueAccent,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(pro.image))),
                    ),
                  ),
                  SizedBox(
                    width: 180,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              pro.name,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '\$${pro.price}',
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                              onPressed: () {
                                cartController.addToCart(product: pro);
                              },
                              icon: const Icon(
                                Icons.shopping_cart_checkout,
                                size: 25,
                              )),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: 5,
          child: InkWell(
            onTap: () {
              pro.isFavorite = !pro.isFavorite;
            },
            child: CircleAvatar(
              maxRadius: 20,
              child: Icon(
                Icons.favorite,
                size: 30,
                color: pro.isFavorite ? Colors.red : null,
              ),
            ),
          ),
        ),
      ]);

  Widget productCard({ProductModel? pro}) => Stack(children: [
        GestureDetector(
          onTap: () {
            Get.to(() => DetailProductScreen(pro: pro));
          },
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Hero(
                  tag: pro!.id,
                  child: Container(
                    height: 250,
                    width: 180,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blueAccent,
                        image: DecorationImage(
                            fit: BoxFit.cover, image: NetworkImage(pro.image))),
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 180,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            pro.name,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '\$${pro.price}',
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                        ],
                      ),
                      IconButton(
                          onPressed: () {
                            cartController.addToCart(product: pro);
                          },
                          icon: const Icon(
                            Icons.shopping_cart_checkout,
                            size: 30,
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: 5,
          child: InkWell(
            onTap: () {
              pro.isFavorite = !pro.isFavorite;
            },
            child: CircleAvatar(
              maxRadius: 20,
              child: Icon(
                Icons.favorite,
                size: 30,
                color: pro.isFavorite ? Colors.red : null,
              ),
            ),
          ),
        ),
      ]);
}
