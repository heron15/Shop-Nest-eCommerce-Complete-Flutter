import 'package:shop_nest/data/model/category_model.dart';

class AllCategoryWrapperModel {
  String? msg;
  List<CategoryModel>? allCategoryList;

  AllCategoryWrapperModel({
    this.msg,
    this.allCategoryList,
  });

  AllCategoryWrapperModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      allCategoryList = <CategoryModel>[];
      json['data'].forEach((v) {
        allCategoryList!.add(CategoryModel.fromJson(v));
      });
    }
  }
}
