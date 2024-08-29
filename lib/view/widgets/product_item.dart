import 'package:flutter/material.dart';
import 'package:shop_nest/utils/app_color.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.star,
    required this.onTapProduct,
    required this.onTapFavorite,
  });

  final String image;
  final String title;
  final String price;
  final String star;
  final VoidCallback onTapProduct;
  final VoidCallback onTapFavorite;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapProduct,
      child: Card(
        color: AppColor.white,
        elevation: 3,
        margin: const EdgeInsets.all(8),
        child: SizedBox(
          width: 140,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(7),
                decoration: const BoxDecoration(
                  color: AppColor.cardBg,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                child: Image.asset(
                  image,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                    color: AppColor.primaryText,
                    fontSize: 12,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: const TextStyle(
                        color: AppColor.primary,
                        fontSize: 12,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          size: 15,
                          color: AppColor.star,
                        ),
                        const SizedBox(width: 2),
                        Text(
                          star,
                          style: const TextStyle(
                            color: AppColor.primaryText,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: onTapFavorite,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 4),
                        margin: const EdgeInsets.only(left: 8),
                        decoration: BoxDecoration(
                          color: AppColor.primary,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Icon(
                          Icons.favorite_border,
                          color: AppColor.white,
                          size: 15,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
