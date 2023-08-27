import 'package:design_ex/view/profile/model/icon_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomIcon extends StatelessWidget {
  CustomIcon({super.key, required this.iconModel});
  IconModel iconModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            maxRadius: 35,
            minRadius: 30,
            child: Center(
              child: Icon(
                iconModel.icon,
                size: 30,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(iconModel.iconName),
          )
        ],
      ),
    );
  }
}
