import 'package:shop_nest/core/export/app_widgets.dart';

class ProductSliderError extends StatelessWidget {
  const ProductSliderError({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColor.grey.withAlpha(50),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            AppString.errorForLoadingData,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColor.grey,
            ),
          ),
          InkWell(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
              margin: const EdgeInsets.only(top: 7),
              decoration: BoxDecoration(
                color: AppColor.grey.withAlpha(45),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Text(
                "Try again",
                style: TextStyle(color: AppColor.primaryText),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
