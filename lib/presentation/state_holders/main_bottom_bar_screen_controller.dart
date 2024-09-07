import 'package:shop_nest/core/export/app_widgets.dart';

class MainBottomBarScreenController extends GetxController {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void switchNavPage(int index) {
    _selectedIndex = index;
    update();
  }
}
