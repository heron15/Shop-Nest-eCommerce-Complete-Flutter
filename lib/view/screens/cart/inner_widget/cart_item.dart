import 'package:flutter/material.dart';
import 'package:shop_nest/utils/app_assets.dart';
import 'package:shop_nest/utils/app_color.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      child: Row(
        children: [
          const SizedBox(width: 5),
          Image.asset(
            AppAssets.product,
            width: 100,
            height: 100,
            fit: BoxFit.fitWidth,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        "Happy new year shoe",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColor.primaryText,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.delete_outline,
                        color: AppColor.primaryText,
                        size: 22,
                      ),
                    )
                  ],
                ),
                const Text(
                  "Color: Red, Size: x",
                  style: TextStyle(
                    height: -0.8,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: AppColor.primaryText,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: Text(
                        "\$1000",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColor.primary,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      padding: const EdgeInsets.all(3),
                      style: IconButton.styleFrom(
                        backgroundColor: AppColor.primary,
                        alignment: Alignment.center,
                        minimumSize: const Size(10, 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      icon: const Icon(
                        Icons.remove,
                        size: 15,
                        color: AppColor.white,
                      ),
                    ),
                    const Text(
                      "01",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColor.primaryText,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      padding: const EdgeInsets.all(3),
                      style: IconButton.styleFrom(
                        backgroundColor: AppColor.primary,
                        alignment: Alignment.center,
                        minimumSize: const Size(10, 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      icon: const Icon(
                        Icons.add,
                        size: 15,
                        color: AppColor.white,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
