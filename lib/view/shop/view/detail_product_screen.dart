import 'package:design_ex/view/shop/controller/shopping_cart_controller.dart';
import 'package:design_ex/view/shop/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class DetailProductScreen extends StatefulWidget {
  DetailProductScreen({super.key, required this.pro});
  ProductModel pro;

  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  bool? isFavorite;
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      isFavorite = widget.pro.isFavorite;
    });
  }

  final cartController = Get.put(ShoppingCartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pro.name),
      ),
      body: GetBuilder<ShoppingCartController>(builder: (context) {
        return ListView(
          children: [
            Hero(
              tag: widget.pro.id,
              child: Image(image: NetworkImage(widget.pro.image)),
            ),
            Card(
              elevation: 0,
              margin: const EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        'Price :\$${widget.pro.price}',
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      child: Text(
                        'Description',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          widget.pro.description,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
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
                        cartController.decrementQty(product: widget.pro);
                      },
                      child: const CircleAvatar(
                        backgroundColor: Colors.white,
                        maxRadius: 25,
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
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        widget.pro.qty.toString(),
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
                        cartController.incrementQty(product: widget.pro);
                      },
                      child: const CircleAvatar(
                        backgroundColor: Colors.white,
                        maxRadius: 25,
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
            )
          ],
        );
      }),
      floatingActionButton: GestureDetector(
        onTap: () {
          if (isFavorite == true) {
            setState(() {
              isFavorite = false;
            });
          } else {
            setState(() {
              isFavorite = true;
            });
          }
        },
        child: CircleAvatar(
          backgroundColor: Colors.blue,
          maxRadius: 25,
          child: Icon(
            Icons.favorite,
            size: 30,
            color: isFavorite! ? Colors.red : Colors.white,
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(10),
        height: 80,
        color: Colors.white,
        width: double.infinity,
        child: Row(children: [
          Expanded(
            flex: 2,
            child: Center(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        'Buy Now',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Center(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.shopping_cart_checkout,
                          size: 30,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Add to Cart',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
