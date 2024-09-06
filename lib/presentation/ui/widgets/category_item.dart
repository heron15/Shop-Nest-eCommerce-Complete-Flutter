import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_nest/core/route/app_route.dart';
import 'package:shop_nest/data/model/category_model.dart';
import 'package:shop_nest/presentation/ui/widgets/center_progress_indicator.dart';
import 'package:shop_nest/utils/api_urls.dart';
import 'package:shop_nest/utils/app_color.dart';
import 'package:shop_nest/utils/assets_path.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.allCategoryModel,
  });

  final CategoryModel allCategoryModel;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: GestureDetector(
          onTap: () {
            context.pushNamed(
              AppRoute.productView,
              pathParameters: {
                'apiUrl': ApiUrls.productViewByCategory(allCategoryModel.id!),
                'appBarTitle': allCategoryModel.categoryName!,
              },
            );
          },
          child: SizedBox(
            width: 60,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CachedNetworkImage(
                    imageUrl: allCategoryModel.categoryImg!,
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                    color: AppColor.primary,
                    colorBlendMode: BlendMode.color,
                    placeholder: (context, url) {
                      return Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: AppColor.cardBg,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const CenterProgressIndicator(
                          indicatorColor: AppColor.primary,
                          indicatorSize: 25,
                        ),
                      );
                    },
                    errorWidget: (context, url, error) {
                      return Container(
                        height: 60,
                        width: 60,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColor.cardBg,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: SvgPicture.asset(
                          AssetsPath.errorImage,
                          fit: BoxFit.fitHeight,
                          color: AppColor.primary,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  allCategoryModel.categoryName!,
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
