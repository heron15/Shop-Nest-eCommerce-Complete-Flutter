import 'package:flutter/material.dart';
import 'package:shop_nest/utils/app_color.dart';

class ProductColorItem extends StatelessWidget {
  const ProductColorItem({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(5),
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        color: AppColor.primary,
        borderRadius: BorderRadius.circular(15),
      ),
      child: index == 0
          ? const Icon(
              Icons.done,
              color: AppColor.white,
              size: 18,
            )
          : null,
    );
  }
}
