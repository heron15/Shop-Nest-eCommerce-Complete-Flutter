

import 'package:shop_nest/core/export/app_widgets.dart';

class ProductViewScreen extends StatefulWidget {
  const ProductViewScreen({
    super.key,
    required this.appBarTitle,
    required this.apiUrl,
  });

  final String apiUrl;
  final String appBarTitle;

  @override
  State<ProductViewScreen> createState() => _ProductViewScreenState();
}

class _ProductViewScreenState extends State<ProductViewScreen> {
  final ProductViewScreenController _productViewScreenController =
      Get.find<ProductViewScreenController>();

  @override
  Widget build(BuildContext context) {
    _productViewScreenController.getProductView(widget.apiUrl);
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.appBarTitle} Product"),
      ),
      body: SafeArea(
        child: CustomRefreshIndicator(
          builder: (context, child, controller) {
            return RefreshIndicatorCustomContainer(
              controller: controller,
              child: child,
            );
          },
          onRefresh: () async {
            _productViewScreenController.getProductView(widget.apiUrl);
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight:Constants.screenHeight-110),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: GetBuilder<ProductViewScreenController>(
                  builder: (controller) {
                    return handleDataScreen(
                      controller.productViewInProgress,
                      const CenterProgressIndicator(),
                      controller.productViewLoadingError,
                      () {
                        controller.getProductView(widget.apiUrl);
                      },
                      controller.productViewList,
                      GridView.count(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 3,
                        mainAxisSpacing: 1,
                        crossAxisSpacing: 1,
                        childAspectRatio: 1 / 1.18,
                        children: List.generate(
                          controller.productViewList.length,
                          (index) {
                            return ProductItem(
                              productViewModel: controller.productViewList[index],
                              icon: Icons.favorite_border,
                              onTapFavorite: () {},
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
