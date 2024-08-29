import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_nest/app.dart';
import 'package:shop_nest/view/screens/auth/complete_profile/complete_profile_screen.dart';
import 'package:shop_nest/view/screens/auth/login/login_screen.dart';
import 'package:shop_nest/view/screens/auth/otp_verify/otp_verify_screen.dart';
import 'package:shop_nest/view/screens/categories/categories_screen.dart';
import 'package:shop_nest/view/screens/home/home_screen.dart';
import 'package:shop_nest/view/screens/mainBottomBar/main_bottom_bar_screen.dart';
import 'package:shop_nest/view/screens/splash/splash_screen.dart';

class AppRoute {
  ///------Route paths------///
  static const String _splashScreenPath = "/splash_screen";
  static const String _loginScreenPath = "/login_screen";
  static const String _otpVerifyScreenPath = "/otp_verify_screen";
  static const String _completeProfileScreenPath = "/complete_profile_screen";
  static const String _mainBottomBarScreenPath = "/main_bottom_bar_screen";
  static const String _homeScreenPath = "/home_screen";
  static const String _categoriesScreenPath = "/categories_screen";

  ///------Route name------///
  static const String splashScreen = "splash";
  static const String loginScreen = "login";
  static const String otpVerifyScreen = "otpVerify";
  static const String completeProfileScreen = "completeProfile";
  static const String mainBottomBarScreen = "mainBottomBar";
  static const String homeScreen = "home";
  static const String categoriesScreen = "categories";

  static final router = GoRouter(
    initialLocation: _splashScreenPath,
    navigatorKey: ShopNest.navigatorKey,
    routes: [
      GoRoute(
        name: splashScreen,
        path: _splashScreenPath,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        name: loginScreen,
        path: _loginScreenPath,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        name: otpVerifyScreen,
        path: _otpVerifyScreenPath,
        builder: (context, state) => const OtpVerifyScreen(),
      ),
      GoRoute(
        name: completeProfileScreen,
        path: _completeProfileScreenPath,
        builder: (context, state) => const CompleteProfileScreen(),
      ),
      GoRoute(
        name: mainBottomBarScreen,
        path: _mainBottomBarScreenPath,
        builder: (context, state) => const MainBottomBarScreen(),
      ),
      GoRoute(
        name: homeScreen,
        path: _homeScreenPath,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        name: categoriesScreen,
        path: _categoriesScreenPath,
        builder: (context, state) => const CategoriesScreen(),
      ),
    ],
  );

  static void removePreviousPageAndGo(BuildContext context, String path) {
    while (context.canPop() == true) {
      context.pop();
    }
    context.pushReplacementNamed(path);
  }
}
