import 'package:get/get.dart';
import 'package:shop_nest/view/screens/home/controller/home_screen_controller.dart';
import 'package:shop_nest/view/screens/main_bottom_bar/controller/main_bottom_bar_screen_controller.dart';
import 'package:shop_nest/view/screens/product_details/controller/product_details_screen_controller.dart';
import 'package:shop_nest/view/screens/splash/controller/splash_screen_controller.dart';

class Dependency extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashScreenController(), fenix: true);
    Get.lazyPut(() => MainBottomBarScreenController(), fenix: true);
    Get.lazyPut(() => HomeScreenController(), fenix: true);
    Get.lazyPut(() => ProductDetailsScreenController(), fenix: true);
  }
}
