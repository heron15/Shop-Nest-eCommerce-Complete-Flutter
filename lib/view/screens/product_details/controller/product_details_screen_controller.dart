import 'package:get/get.dart';

class ProductDetailsScreenController extends GetxController {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setCurrentIndex(int index) {
    _currentIndex = index;
    update();
  }
}
