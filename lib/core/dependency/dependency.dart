import 'package:shop_nest/core/export/app_widgets.dart';

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
