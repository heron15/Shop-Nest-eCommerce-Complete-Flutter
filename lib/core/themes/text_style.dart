import 'package:flutter/material.dart';
import 'package:shop_nest/utils/app_color.dart';

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
