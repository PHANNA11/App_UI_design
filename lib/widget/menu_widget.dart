import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

// ignore: must_be_immutable
class MenuWidget extends StatelessWidget {
  MenuWidget({super.key, this.title, required this.callRoute, this.imageIcons});
  String? title = '';
  final void Function() callRoute;
  String? imageIcons;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: callRoute,
        child: Container(
          padding: const EdgeInsets.all(8),
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(26, 142, 135, 135),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(imageIcons.toString()))),
              ),
              Text(
                title!,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Icon(Icons.arrow_forward_ios_outlined)
            ],
          ),
        ),
      ),
    );
  }
}
