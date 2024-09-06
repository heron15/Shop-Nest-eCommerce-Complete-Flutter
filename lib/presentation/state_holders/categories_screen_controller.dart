import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shop_nest/data/model/category_model.dart';
import 'package:shop_nest/data/model/network_response_model.dart';
import 'package:shop_nest/data/model/wrapper/all_category_wrapper_model.dart';
import 'package:shop_nest/data/network_caller/network_caller.dart';
import 'package:shop_nest/utils/api_urls.dart';
import 'package:shop_nest/presentation/ui/widgets/toast.dart';
import 'package:shop_nest/utils/app_color.dart';

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
