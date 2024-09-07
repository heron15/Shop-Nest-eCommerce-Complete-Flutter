import 'package:shop_nest/core/export/app_widgets.dart';

class ProductDetailsScreenController extends GetxController {
  int _currentIndex = 0;
  bool _productDetailsInProgress = false;
  bool _productDetailsLoadingError = false;
  ProductDetailsModel _productDetailsModel = ProductDetailsModel();

  int _quantity = 1;
  int _selectedColorIndex = 0;
  Color _selectedColor = AppColor.white;

  int _selectedSizeIndex = 0;
  String _selectedSize = "";

  int get currentIndex => _currentIndex;

  bool get productDetailsInProgress => _productDetailsInProgress;

  bool get productDetailsLoadingError => _productDetailsLoadingError;

  ProductDetailsModel get productDetailsModel => _productDetailsModel;

  int get quantity => _quantity;

  int get selectedColorIndex => _selectedColorIndex;

  Color get selectedColor => _selectedColor;

  int get selectedSizeIndex => _selectedSizeIndex;

  String get selectedSize => _selectedSize;

  void setCurrentIndex(int index) {
    _currentIndex = index;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getProductDetails;
  }

  Future<void> getProductDetails(String apiUrl) async {
    _productDetailsInProgress = true;
    update();

    NetworkResponseModel response = await NetworkCaller.getRequest(apiUrl);

    if (response.isSuccess) {
      _productDetailsModel =
          ProductDetailsWrapperModel.fromJson(response.responseData).productDetailsList!.first;
    } else {
      _productDetailsLoadingError = true;
      update();

      showToast(
        response.errorMessage!,
        AppColor.red,
        AppColor.white,
        ToastGravity.BOTTOM,
      );
    }

    _productDetailsInProgress = false;
    update();
  }

  void quantityIncrease() {
    _quantity++;
    update();
  }

  void quantityDecrease() {
    if (_quantity > 1) {
      _quantity--;
      update();
    }
  }

  void selectedColorIndexUpdate(int index) {
    _selectedColorIndex = index;
    update();
  }

  void selectedColorUpdate(Color color) {
    _selectedColor = color;
    update();
  }

  void selectedSizeIndexUpdate(int index) {
    _selectedSizeIndex = index;
    update();
  }

  void selectedSizeUpdate(String size) {
    _selectedSize = size;
    update();
  }
}
