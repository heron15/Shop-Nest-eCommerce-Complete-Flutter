import 'package:flutter/material.dart';
import 'package:shop_nest/utils/app_color.dart';

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
