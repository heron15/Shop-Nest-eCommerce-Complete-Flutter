import 'package:shop_nest/core/export/app_widgets.dart';

AppBarTheme getAppBarTheme() => const AppBarTheme(
      backgroundColor: AppColor.white,
      foregroundColor: AppColor.primaryText,
      surfaceTintColor: AppColor.white,
      elevation: 0.5,
      shadowColor: Colors.black,
      titleTextStyle: TextStyle(
        fontSize: 18,
        color: AppColor.primaryText,
        fontWeight: FontWeight.w500,
      ),
    );
