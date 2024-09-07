import 'package:shop_nest/core/export/app_widgets.dart';

TextTheme getTextTheme() => const TextTheme(
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: AppColor.primaryText,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        color: AppColor.primaryText,
        fontWeight: FontWeight.w400,
      ),
    );
