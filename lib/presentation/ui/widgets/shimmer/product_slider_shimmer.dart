import 'package:flutter/material.dart';
import 'package:shop_nest/presentation/ui/widgets/shimmer/shimmer_widget.dart';
import 'package:shop_nest/utils/app_color.dart';

class ProductSliderShimmer extends StatelessWidget {
  const ProductSliderShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerWidget(
      child: Container(
        width: double.maxFinite,
        height: 170,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
