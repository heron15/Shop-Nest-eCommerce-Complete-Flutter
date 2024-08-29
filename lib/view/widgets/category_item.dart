import 'package:flutter/material.dart';
import 'package:shop_nest/utils/app_color.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.image,
    required this.title,
  });

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              image,
              height: 70,
              width: 70,
              fit: BoxFit.cover,
              color: AppColor.primary,
              colorBlendMode: BlendMode.color,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: const TextStyle(
              color: AppColor.primary,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
