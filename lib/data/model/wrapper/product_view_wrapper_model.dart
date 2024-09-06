import 'package:shop_nest/data/model/product_model.dart';

class ProductViewWrapperModel {
  String? msg;
  List<ProductModel>? productViewList;

  ProductViewWrapperModel({
    this.msg,
    this.productViewList,
  });

  ProductViewWrapperModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      productViewList = <ProductModel>[];
      json['data'].forEach((v) {
        productViewList!.add(ProductModel.fromJson(v));
      });
    }
  }
}
