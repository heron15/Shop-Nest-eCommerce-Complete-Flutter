import 'package:shop_nest/data/model/product_details_model.dart';

class ProductDetailsWrapperModel {
  String? msg;
  List<ProductDetailsModel>? productDetailsList;

  ProductDetailsWrapperModel({
    this.msg,
    this.productDetailsList,
  });

  ProductDetailsWrapperModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      productDetailsList = <ProductDetailsModel>[];
      json['data'].forEach((v) {
        productDetailsList!.add(ProductDetailsModel.fromJson(v));
      });
    }
  }
}
