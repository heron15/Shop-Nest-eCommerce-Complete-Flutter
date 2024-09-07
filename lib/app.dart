import 'package:shop_nest/core/export/app_widgets.dart';

class ShopNest extends StatelessWidget {
  const ShopNest({super.key});

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return GetMaterialApp.router(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 200),
      routerDelegate: AppRoute.router.routerDelegate,
      routeInformationParser: AppRoute.router.routeInformationParser,
      routeInformationProvider: AppRoute.router.routeInformationProvider,
      initialBinding: Dependency(),
      theme: ThemeData(
        colorSchemeSeed: AppColor.primary,
        scaffoldBackgroundColor: AppColor.white,
        elevatedButtonTheme: getElevatedButtonThemeData(),
        appBarTheme: getAppBarTheme(),
        textTheme: getTextTheme(),
      ),
    );
  }
}
