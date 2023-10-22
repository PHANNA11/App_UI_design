import 'dart:developer';
import 'dart:ui';

import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalModel extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'en': {
          'management': 'Management',
          'profile': 'PROFILE',
          'shop': 'SHOP',
          'hello': 'Hello',
          'dark_mode': 'Dark Mode',
          'light_mode': 'Light Mode',
          'setting': 'Setting',
          'dashboard': 'DashBoard',
          'community': 'Community',
          'about': 'About',
          'about_me': 'About Me',
          'top_sell': 'Top Sell',
          'sell_chart': 'Sell Chart',
          'about_product': 'About Product',
          'add_to_card': 'Add to Card',
          'product_not_have_qty': 'The Product don\'t have Qty..!!(0 qty)',
          'your_shopping_card': 'Your Shopping Card',
          'total': 'Total',
          'order': 'Order',
          'payment_order': 'Payment Order',
          'pay': 'Payment',
          'choose_credit_card': 'Choose Credit Card',
          'select_your_card': 'Select Your Caerd',
          'cancel': 'Cancel',
          'ok': 'ok',
          'add': 'Add'
        },
        'KH': {
          'management': 'ការគ្រប់គ្រង',
          'profile': 'ប្រូហ្វាល',
          'shop': 'ហាង',
          'hello': 'សួស្តី',
          'dark_mode': 'ផ្ទាំងពណ៌ខ្មៅ',
          'light_mode': 'ផ្ទាំងពណ៌ស',
          'setting': 'ការកំណត់',
          'dashboard': 'ផ្ទាំងគ្រប់គ្រង',
          'community': 'សហគមន៏',
          'about': 'អំពី',
          'about_me': 'អំពីខ្ញុំ',
          'top_sell': 'លក់ដាច់​ បំផុត',
          'sell_chart': 'តារាងលក់',
          'about_product': 'អំពី ផលិតផល',
          'add_to_card': 'បញ្ជូលទំនិញ',
          'product_not_have_qty': 'ផលិតផល មិនមានចំនួនកម្មង់​ (ចំនួន​ ០)!!!',
          'your_shopping_card': 'ទំនិញរបស់អ្នក ដែលបានរើស',
          'total': 'សរុប',
          'order': 'កម្មង់',
          'payment_order': 'ទូទាត់ការកម្មង់',
          'pay': 'ទូទាត់',
          'choose_credit_card': 'ជ្រើសរើស​ កាត​ឥណទាន',
          'select_your_card': 'ជ្រើសរើស​ កាត​ឥណទាន របស់អ្នក',
          'cancel': 'បោះបង់',
          'ok': 'យល់ព្រម',
          'add': 'បន្ថែម'
        }
      };
}

class TraslateLanguege extends GetxController {
  final box = GetStorage();
  bool get isEnglish => box.read('english') ?? true;
  Locale get lang =>
      isEnglish ? const Locale('en', 'US') : const Locale('KH', 'KH');
  void changeLang(bool val) {
    box.write('english', val);
    Get.updateLocale(lang);
    update();
  }
}