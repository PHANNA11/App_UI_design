import 'package:design_ex/view/shop/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DetailProductScreen extends StatefulWidget {
  DetailProductScreen({super.key, required this.pro});
  ProductModel pro;

  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pro.name),
      ),
      body: Column(
        children: [
          Hero(
            tag: widget.pro.id,
            child: Image(image: NetworkImage(widget.pro.image)),
          ),
          Text(widget.pro.description)
        ],
      ),
    );
  }
}
