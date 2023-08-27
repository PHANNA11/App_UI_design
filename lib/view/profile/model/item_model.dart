import 'package:flutter/material.dart';

class ItemModel {
  late String title;
  late String subTitle;
  late Color color;
  late IconData icon;
  ItemModel(
      {required this.icon,
      required this.color,
      required this.subTitle,
      required this.title});
}

List<ItemModel> listItems = [
  ItemModel(
      icon: Icons.location_on,
      color: Colors.red,
      subTitle: 'Phnom Penh',
      title: 'Address '),
  ItemModel(
      icon: Icons.privacy_tip,
      color: Colors.blueAccent,
      subTitle: 'System permistion',
      title: 'Privacy'),
  ItemModel(
      icon: Icons.generating_tokens_sharp,
      color: Colors.greenAccent,
      subTitle: 'menu option',
      title: 'General'),
  ItemModel(
      icon: Icons.notification_important,
      color: Colors.blueGrey,
      subTitle: 'allow notification alert',
      title: 'Notification'),
];
