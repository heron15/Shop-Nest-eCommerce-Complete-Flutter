import 'package:get/get.dart';
import 'package:shop_nest/presentation/state_holders/categories_screen_controller.dart';
import 'package:shop_nest/presentation/state_holders/home_screen_controller.dart';
import 'package:shop_nest/presentation/state_holders/main_bottom_bar_screen_controller.dart';
import 'package:shop_nest/presentation/state_holders/product_details_screen_controller.dart';
import 'package:shop_nest/presentation/state_holders/product_view_screen_controller.dart';
import 'package:shop_nest/presentation/state_holders/splash_screen_controller.dart';

class Dependency extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashScreenController(), fenix: true);
    Get.lazyPut(() => MainBottomBarScreenController(), fenix: true);
    Get.lazyPut(() => HomeScreenController(), fenix: true);
    Get.lazyPut(() => ProductDetailsScreenController(), fenix: true);
    Get.lazyPut(() => CategoriesScreenController(), fenix: true);
    Get.lazyPut(() => ProductViewScreenController(), fenix: true);
  }
}
