import 'package:get/get.dart';

class MainBottomBarScreenController extends GetxController {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void switchNavPage(int index) {
    _selectedIndex = index;
    update();
  }
}
