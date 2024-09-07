import 'package:shop_nest/core/export/app_widgets.dart';

class CategoriesScreenController extends GetxController {
  bool _allCategoryInProgress = false;
  bool _allCategoryLoadingError = false;
  List<CategoryModel> _allCategoryList = [];

  bool get allCategoriesInProgress => _allCategoryInProgress;

  bool get allCategoryLoadingError => _allCategoryLoadingError;

  List<CategoryModel> get allCategoriesList => _allCategoryList;

  @override
  void onInit() {
    super.onInit();
    getAllCategory();
  }

  Future<void> getAllCategory() async {
    _allCategoryInProgress = true;
    update();

    NetworkResponseModel response = await NetworkCaller.getRequest(ApiUrls.allCategory);

    if (response.isSuccess) {
      AllCategoryWrapperModel allCategoryWrapperModel =
          AllCategoryWrapperModel.fromJson(response.responseData);
      _allCategoryList = allCategoryWrapperModel.allCategoryList ?? [];
    } else {
      _allCategoryLoadingError = true;
      update();

      showToast(
        response.errorMessage!,
        AppColor.red,
        AppColor.white,
        ToastGravity.BOTTOM,
      );
    }

    _allCategoryInProgress = false;
    update();
  }
}
