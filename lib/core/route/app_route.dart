import 'package:shop_nest/core/export/app_widgets.dart';

class AppRoute {
  ///------Route paths------///
  static const String _splashScreenPath = "/splash_screen";
  static const String _loginScreenPath = "/login_screen";
  static const String _otpVerifyScreenPath = "/otp_verify_screen";
  static const String _completeProfileScreenPath = "/complete_profile_screen";
  static const String _mainBottomBarScreenPath = "/main_bottom_bar_screen";
  static const String _homeScreenPath = "/home_screen";
  static const String _categoriesScreenPath = "/categories_screen";
  static const String _productViewScreenPath = "/product_view_screen/:apiUrl/:appBarTitle";
  static const String _productDetailsScreenPath = "/product_details_screen/:id";
  static const String _reviewScreenPath = "/review_screen";
  static const String _addReviewScreenPath = "/add_review_screen";

  ///------Route name------///
  static const String splashScreen = "splash";
  static const String loginScreen = "login";
  static const String otpVerifyScreen = "otpVerify";
  static const String completeProfileScreen = "completeProfile";
  static const String mainBottomBarScreen = "mainBottomBar";
  static const String homeScreen = "home";
  static const String categoriesScreen = "categories";
  static const String productView = "productView";
  static const String productDetails = "productDetails";
  static const String reviewScreen = "reviewScreen";
  static const String addReviewScreen = "addReviewScreen";

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
      GoRoute(
        name: productView,
        path: _productViewScreenPath,
        builder: (context, state) => ProductViewScreen(
          appBarTitle: state.pathParameters['appBarTitle']!,
          apiUrl: state.pathParameters['apiUrl']!,
        ),
      ),
      GoRoute(
        name: productDetails,
        path: _productDetailsScreenPath,
        builder: (context, state) => ProductDetailsScreen(
          id: state.pathParameters['id']!,
        ),
      ),
      GoRoute(
        name: reviewScreen,
        path: _reviewScreenPath,
        builder: (context, state) => const ReviewScreen(),
      ),
      GoRoute(
        name: addReviewScreen,
        path: _addReviewScreenPath,
        builder: (context, state) => const AddReviewScreen(),
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
