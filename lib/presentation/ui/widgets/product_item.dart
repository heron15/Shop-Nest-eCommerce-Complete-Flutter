import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_nest/core/route/app_route.dart';
import 'package:shop_nest/data/model/product_model.dart';
import 'package:shop_nest/presentation/ui/widgets/center_progress_indicator.dart';
import 'package:shop_nest/utils/app_color.dart';
import 'package:shop_nest/utils/assets_path.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.productViewModel,
    required this.icon,
    required this.onTapFavorite,
  });

  final ProductModel productViewModel;
  final IconData icon;
  final VoidCallback onTapFavorite;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: GestureDetector(
        onTap: () {
          context.pushNamed(
            AppRoute.productDetails,
            pathParameters: {
              'id': productViewModel.id.toString(),
            },
          );
        },
        child: Card(
          color: AppColor.white,
          elevation: 3,
          child: SizedBox(
            width: 130,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///------product image part------///
                Container(
                  padding: const EdgeInsets.all(7),
                  height: 100,
                  decoration: const BoxDecoration(
                    color: AppColor.cardBg,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: productViewModel.image!,
                    fit: BoxFit.fitWidth,
                    placeholder: (context, url) {
                      return const CenterProgressIndicator(
                        indicatorColor: AppColor.primary,
                        indicatorSize: 25,
                      );
                    },
                    errorWidget: (context, url, error) {
                      return SvgPicture.asset(
                        AssetsPath.errorImage,
                        fit: BoxFit.fitHeight,
                        color: AppColor.primary,
                      );
                    },
                  ),
                ),

                ///------product title part------///
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  child: Text(
                    productViewModel.title!,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                      color: AppColor.primaryText,
                      fontSize: 12,
                    ),
                  ),
                ),

                ///------price, rating & favorite button part------///
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        productViewModel.price!,
                        style: const TextStyle(
                          color: AppColor.primary,
                          fontSize: 12,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            size: 14,
                            color: AppColor.star,
                          ),
                          const SizedBox(width: 2),
                          Text(
                            productViewModel.star!.toStringAsFixed(1),
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
                          padding: const EdgeInsets.all(4),
                          margin: const EdgeInsets.only(left: 8),
                          decoration: BoxDecoration(
                            color: AppColor.primary,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Icon(
                            icon,
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
      ),
    );
  }
}
