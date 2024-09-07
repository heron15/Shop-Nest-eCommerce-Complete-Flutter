import 'package:shop_nest/core/export/app_widgets.dart';

class ProductSizeItem extends StatelessWidget {
  const ProductSizeItem({
    super.key,
    required this.index,
    required this.productSize,
    required this.controller,
  });

  final int index;
  final String productSize;
  final ProductDetailsScreenController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.selectedSizeIndexUpdate(index);
        controller.selectedSizeUpdate(productSize);
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(5),
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          color: controller.selectedSizeIndex == index ? AppColor.primary : AppColor.white,
          borderRadius: BorderRadius.circular(15),
          border: const Border.fromBorderSide(
            BorderSide(
              width: 1,
              color: AppColor.primaryText,
            ),
          ),
        ),
        child: Text(
          productSize,
          style: TextStyle(
            color: controller.selectedSizeIndex == index ? AppColor.white : AppColor.primaryText,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
