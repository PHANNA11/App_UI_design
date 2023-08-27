import 'package:design_ex/view/profile/model/item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ItemMenuCustom extends StatelessWidget {
  ItemMenuCustom({super.key, required this.itemMenuCustom});
  ItemModel itemMenuCustom;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Colors.white),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: CircleAvatar(
                maxRadius: 35,
                backgroundColor: itemMenuCustom.color,
                child: Center(
                  child: Icon(
                    itemMenuCustom.icon,
                    size: 40,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    itemMenuCustom.title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    itemMenuCustom.subTitle,
                    style: TextStyle(fontSize: 17, color: Colors.black54),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
