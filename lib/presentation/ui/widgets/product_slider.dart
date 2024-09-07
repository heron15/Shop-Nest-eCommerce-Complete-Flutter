

import 'package:shop_nest/core/export/app_widgets.dart';

class ProductSlider extends StatelessWidget {
  const ProductSlider({
    super.key,
    required this.productSliderModel,
  });

  final ProductSliderModel productSliderModel;

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
          FittedBox(
            child: CachedNetworkImage(
              height: 110,
              width: 150,
              fit: BoxFit.fitWidth,
              imageUrl: productSliderModel.image!,
              placeholder: (context, url) => const CenterProgressIndicator(
                indicatorColor: AppColor.white,
                indicatorSize: 30,
              ),
              errorWidget: (context, url, error) => SvgPicture.asset(
                AssetsPath.errorImage,
                height: 110,
                width: 150,
                fit: BoxFit.fitHeight,
                color: AppColor.white,
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: FittedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    productSliderModel.title!,
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
            ),
          ),
        ],
      ),
    );
  }
}
