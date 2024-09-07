import 'package:shop_nest/core/export/app_widgets.dart';

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
