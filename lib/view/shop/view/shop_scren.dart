import 'package:design_ex/view/shop/model/product_model.dart';
import 'package:design_ex/view/shop/view/cart_screen.dart';
import 'package:design_ex/view/shop/view/detail_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:badges/badges.dart' as badges;

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  final searchController = TextEditingController();
  List<ProductModel> cartList = [];
  List<ProductModel> filterList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('E-Shop'),
        actions: [
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartScreen(list: cartList),
                    ));
              },
              child: badges.Badge(
                showBadge: cartList.isEmpty ? false : true,
                badgeContent: Text(cartList.length.toString()),
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
                  setState(() {
                    filterList = productList
                        .where((pro) => pro.name
                            .toLowerCase()
                            .contains(value.toLowerCase()))
                        .toList();
                  });
                },
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'Popular Products',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: List.generate(
                    searchController.text.isEmpty || filterList.isEmpty
                        ? productList.length
                        : filterList.length,
                    (index) => productCard(
                        pro: searchController.text.isEmpty || filterList.isEmpty
                            ? productList[index]
                            : filterList[index])),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget productCard({ProductModel? pro}) => Stack(children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailProductScreen(pro: pro),
                ));
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
                            setState(() {
                              cartList.add(pro);
                            });
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
              setState(() {
                pro.isFavorite = !pro.isFavorite;
              });
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
