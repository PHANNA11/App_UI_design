import 'package:flutter/material.dart';

class IconModel {
  late String iconName;
  late IconData icon;
  IconModel({required this.icon, required this.iconName});
}

List<IconModel> listIcons = [
  IconModel(icon: Icons.currency_exchange, iconName: 'Wallet'),
  IconModel(icon: Icons.new_releases_sharp, iconName: 'New'),
  IconModel(icon: Icons.discount_rounded, iconName: 'Branding'),
  IconModel(icon: Icons.thumb_up_off_alt, iconName: 'Most Like')
];
