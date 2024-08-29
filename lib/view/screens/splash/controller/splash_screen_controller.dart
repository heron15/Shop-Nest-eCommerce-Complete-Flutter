import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shop_nest/app.dart';
import 'package:shop_nest/core/route/app_route.dart';

class SplashScreenController extends GetxController {
  String _versionCode = '';

  String get versionCode => _versionCode;

  @override
  void onInit() {
    super.onInit();
    _fetchVersionCode();
    _moveToNextScreen();
  }

  Future<void> _fetchVersionCode() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    _versionCode = packageInfo.version;
    update();
  }

  Future<void> _moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    ShopNest.navigatorKey.currentContext!.pushReplacementNamed(
      AppRoute.mainBottomBarScreen,
    );
  }
}
