import 'package:flutter/material.dart';
import 'package:shop_nest/utils/app_color.dart';

class ProductSizeItem extends StatelessWidget {
  const ProductSizeItem({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(5),
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        color: index == 1 ? AppColor.primary : AppColor.white,
        borderRadius: BorderRadius.circular(15),
        border: const Border.fromBorderSide(
          BorderSide(
            width: 1,
            color: AppColor.primaryText,
          ),
        ),
      ),
      child: Text(
        "XL",
        style: TextStyle(
          color: index == 1 ? AppColor.white : AppColor.primaryText,
          fontSize: 12,
        ),
      ),
    );
  }
}
