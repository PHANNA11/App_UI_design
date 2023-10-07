import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShopWidget {
  Widget shimmerGridProductCart() => Shimmer.fromColors(
        baseColor: const Color.fromARGB(255, 215, 213, 213),
        highlightColor: Colors.grey,
        child: SizedBox(
          height: 600,
          child: GridView.count(
            mainAxisSpacing: 4,
            crossAxisCount: 2,
            crossAxisSpacing: 4,
            childAspectRatio: 10 / 16,
            children: List.generate(
              4,
              (index) => DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Container(
                  height: 250,
                  width: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueAccent,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
