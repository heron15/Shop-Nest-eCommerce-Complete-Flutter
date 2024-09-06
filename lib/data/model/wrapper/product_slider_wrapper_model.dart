import 'package:shop_nest/data/model/product_slider_model.dart';

class ProductSliderWrapperModel {
  String? msg;
  List<ProductSliderModel>? productSliderList;

  ProductSliderWrapperModel({this.msg, this.productSliderList});

  ProductSliderWrapperModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      productSliderList = <ProductSliderModel>[];
      json['data'].forEach((v) {
        productSliderList!.add(ProductSliderModel.fromJson(v));
      });
    }
  }
}
