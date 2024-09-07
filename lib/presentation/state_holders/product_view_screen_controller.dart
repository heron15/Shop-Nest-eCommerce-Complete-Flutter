

import 'package:shop_nest/core/export/app_widgets.dart';

class ProductViewScreenController extends GetxController {
  bool _productViewInProgress = false;
  bool _productViewLoadingError = false;
  List<ProductModel> _productViewList = [];

  bool get productViewInProgress => _productViewInProgress;

  bool get productViewLoadingError => _productViewLoadingError;

  List<ProductModel> get productViewList => _productViewList;

  @override
  void onInit() {
    super.onInit();
    getProductView;
  }

  Future<void> getProductView(String apiUrl) async {
    _productViewInProgress = true;
    update();

    NetworkResponseModel response = await NetworkCaller.getRequest(apiUrl);

    if (response.isSuccess) {
      ProductViewWrapperModel productViewWrapperModel =
          ProductViewWrapperModel.fromJson(response.responseData);
      _productViewList = productViewWrapperModel.productViewList ?? [];
    } else {
      _productViewLoadingError = true;
      update();

      showToast(
        response.errorMessage!,
        AppColor.red,
        AppColor.white,
        ToastGravity.BOTTOM,
      );
    }

    _productViewInProgress = false;
    update();
  }
}
