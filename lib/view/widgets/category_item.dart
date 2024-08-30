import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_nest/core/route/app_route.dart';
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
    return FittedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: GestureDetector(
          onTap: (){
            context.pushNamed(AppRoute.categoryProductView);
          },
          child: SizedBox(
            width: 60,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    image,
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                    color: AppColor.primary,
                    colorBlendMode: BlendMode.color,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColor.primary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
