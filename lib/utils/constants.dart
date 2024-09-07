import 'package:shop_nest/core/export/app_widgets.dart';

class Constants {
  static String? validateEmail(String? value) {
    const emailPattern = r'^[^@]+@[^@]+\.[^@]+';
    final regex = RegExp(emailPattern);
    if (value == null || value.isEmpty) {
      return "Please enter your email";
    } else if (!regex.hasMatch(value)) {
      return "Please enter a valid email";
    }
    return null;
  }

  static String? nullAndNotEmpty(String? value, String errorMessage) {
    if (value == null || value.trim().isEmpty) {
      return errorMessage;
    }
    return null;
  }

  static double screenHeight = MediaQuery.of(ShopNest.navigatorKey.currentContext!).size.height;
  static double screenWidth = MediaQuery.of(ShopNest.navigatorKey.currentContext!).size.width;
}
