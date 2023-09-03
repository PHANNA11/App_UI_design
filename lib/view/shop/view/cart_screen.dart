import 'package:design_ex/view/profile/model/icon_model.dart';
import 'package:design_ex/view/shop/view/detail_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../model/product_model.dart';

class CartScreen extends StatefulWidget {
  CartScreen({super.key, required this.list});
  List<ProductModel> list;
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: widget.list.length,
        itemBuilder: (context, index) => buildCart(widget.list[index]),
      ),
    );
  }

  Widget buildCart(ProductModel product) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailProductScreen(pro: product),
                ));
          },
          child: Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Flexible(
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(product.image),
                            fit: BoxFit.cover)),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  product.name,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  '\$${product.price}',
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                        ),
                        DecoratedBox(
                          decoration: const BoxDecoration(),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      product.qty -= 1;
                                      if (product.qty == 0) {
                                        int selectIndex = widget.list
                                            .indexWhere((element) =>
                                                element.id == product.id);
                                        widget.list.removeAt(selectIndex);
                                      }
                                    });
                                  },
                                  child: const CircleAvatar(
                                    backgroundColor: Colors.white,
                                    maxRadius: 16,
                                    child: Center(
                                      child: Icon(
                                        Icons.remove,
                                        size: 30,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 30,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(255, 255, 255, 1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    product.qty.toString(),
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      product.qty += 1;
                                    });
                                  },
                                  child: const CircleAvatar(
                                    backgroundColor: Colors.white,
                                    maxRadius: 16,
                                    child: Center(
                                      child: Icon(
                                        Icons.add,
                                        size: 30,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
