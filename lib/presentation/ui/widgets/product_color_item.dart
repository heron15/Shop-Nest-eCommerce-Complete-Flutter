import 'package:shop_nest/core/export/app_widgets.dart';

class ProductColorItem extends StatelessWidget {
  const ProductColorItem({
    super.key,
    required this.index,
    required this.color,
    required this.controller,
  });

  final int index;
  final Color color;
  final ProductDetailsScreenController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.selectedColorIndexUpdate(index);
        controller.selectedColorUpdate(color);
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(5),
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: controller.selectedColorIndex == index
            ? const Icon(
                Icons.done,
                color: AppColor.white,
                size: 18,
              )
            : null,
      ),
    );
  }
}
