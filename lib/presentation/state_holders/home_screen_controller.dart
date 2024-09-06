import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shop_nest/data/model/network_response_model.dart';
import 'package:shop_nest/data/model/product_model.dart';
import 'package:shop_nest/data/model/product_slider_model.dart';
import 'package:shop_nest/data/model/wrapper/product_slider_wrapper_model.dart';
import 'package:shop_nest/data/model/wrapper/product_view_wrapper_model.dart';
import 'package:shop_nest/data/network_caller/network_caller.dart';
import 'package:shop_nest/utils/api_urls.dart';
import 'package:shop_nest/presentation/ui/widgets/toast.dart';
import 'package:shop_nest/utils/app_color.dart';

class HomeScreenController extends GetxController {
  ///------for product slider needed variable------///
  int _currentIndex = 0;
  bool _productSliderInProgress = false;
  bool _productSliderLoadingError = false;
  List<ProductSliderModel> _productSliderList = [];

  ///------for popular product needed variable------///
  bool _popularProductInProgress = false;
  bool _popularProductLoadingError = false;
  List<ProductModel> _popularProductList = [];

  ///------for special product needed variable------///
  bool _specialProductInProgress = false;
  bool _specialProductLoadingError = false;
  List<ProductModel> _specialProductList = [];

  ///------for new product needed variable------///
  bool _newProductInProgress = false;
  bool _newProductLoadingError = false;
  List<ProductModel> _newProductList = [];

  ///------for product slider get method------///
  int get currentIndex => _currentIndex;

  bool get productSliderInProgress => _productSliderInProgress;

  bool get productSliderLoadingError => _productSliderLoadingError;

  List<ProductSliderModel> get productSliderList => _productSliderList;

  ///------for popular product get method------///
  bool get popularProductInProgress => _popularProductInProgress;

  bool get popularProductLoadingError => _popularProductLoadingError;

  List<ProductModel> get popularProductList => _popularProductList;

  ///------for special product get method------///
  bool get specialProductInProgress => _specialProductInProgress;

  bool get specialProductLoadingError => _specialProductLoadingError;

  List<ProductModel> get specialProductList => _specialProductList;

  ///------for new product get method------///
  bool get newProductInProgress => _newProductInProgress;

  bool get newProductLoadingError => _newProductLoadingError;

  List<ProductModel> get newProductList => _newProductList;

  @override
  void onInit() {
    super.onInit();
    getProductSlider();
    getPopularProduct();
    getSpecialProduct();
    getNewProduct();
  }

  ///------slider index handle function------///
  void setCurrentIndex(int index) {
    _currentIndex = index;
    update();
  }

  ///------product slider api call function------///
  Future<void> getProductSlider() async {
    _productSliderInProgress = true;
    update();

    NetworkResponseModel response = await NetworkCaller.getRequest(ApiUrls.productSlider);

    if (response.isSuccess) {
      ProductSliderWrapperModel productSliderWrapperModel =
          ProductSliderWrapperModel.fromJson(response.responseData);
      _productSliderList = productSliderWrapperModel.productSliderList ?? [];
    } else {
      _productSliderLoadingError = true;
      update();

      showToast(
        response.errorMessage!,
        AppColor.red,
        AppColor.white,
        ToastGravity.BOTTOM,
      );
    }

    _productSliderInProgress = false;
    update();
  }

  ///------popular product view api call function------///
  Future<void> getPopularProduct() async {
    _popularProductInProgress = true;
    update();

    NetworkResponseModel response = await NetworkCaller.getRequest(ApiUrls.popularProduct);

    if (response.isSuccess) {
      ProductViewWrapperModel productViewWrapperModel =
          ProductViewWrapperModel.fromJson(response.responseData);
      _popularProductList = productViewWrapperModel.productViewList!.take(10).toList();
    } else {
      _popularProductLoadingError = true;
      update();

      showToast(
        response.errorMessage!,
        AppColor.red,
        AppColor.white,
        ToastGravity.BOTTOM,
      );
    }

    _popularProductInProgress = false;
    update();
  }

  ///------special product view api call function------///
  Future<void> getSpecialProduct() async {
    _specialProductInProgress = true;
    update();

    NetworkResponseModel response = await NetworkCaller.getRequest(ApiUrls.specialProduct);

    if (response.isSuccess) {
      ProductViewWrapperModel productViewWrapperModel =
          ProductViewWrapperModel.fromJson(response.responseData);
      _specialProductList = productViewWrapperModel.productViewList!.take(10).toList();
    } else {
      _specialProductLoadingError = true;
      update();

      showToast(
        response.errorMessage!,
        AppColor.red,
        AppColor.white,
        ToastGravity.BOTTOM,
      );
    }

    _specialProductInProgress = false;
    update();
  }

  ///------new product view api call function------///
  Future<void> getNewProduct() async {
    _newProductInProgress = true;
    update();

    NetworkResponseModel response = await NetworkCaller.getRequest(ApiUrls.newProduct);

    if (response.isSuccess) {
      ProductViewWrapperModel productViewWrapperModel =
          ProductViewWrapperModel.fromJson(response.responseData);
      _newProductList = productViewWrapperModel.productViewList!.take(10).toList();
    } else {
      _newProductLoadingError = true;
      update();

      showToast(
        response.errorMessage!,
        AppColor.red,
        AppColor.white,
        ToastGravity.BOTTOM,
      );
    }

    _newProductInProgress = false;
    update();
  }
}
