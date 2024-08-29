import 'package:flutter/material.dart';
import 'package:shop_nest/utils/app_color.dart';

ElevatedButtonThemeData getElevatedButtonThemeData() => ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    backgroundColor: AppColor.primary,
    foregroundColor: AppColor.white,
    padding: const EdgeInsets.symmetric(vertical: 15),
    fixedSize: const Size.fromWidth(double.maxFinite),
    textStyle: const TextStyle(
      color: AppColor.white,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
  ),
);