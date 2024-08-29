import 'package:flutter/material.dart';
import 'package:shop_nest/utils/app_color.dart';

class SliderBanner extends StatelessWidget {
  const SliderBanner({
    super.key,
    required this.image,
    required this.title,
  });

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColor.primary,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset(
            image,
            height: 110,
            width: 150,
            fit: BoxFit.fitWidth,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColor.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 25),
                  margin: const EdgeInsets.only(top: 3),
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Text(
                    "Buy Now",
                    style: TextStyle(
                      color: AppColor.primary,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
