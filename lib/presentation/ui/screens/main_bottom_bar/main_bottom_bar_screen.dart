import 'package:shop_nest/core/export/app_widgets.dart';

class MainBottomBarScreen extends StatefulWidget {
  const MainBottomBarScreen({super.key});

  @override
  State<MainBottomBarScreen> createState() => _MainBottomBarState();
}

class _MainBottomBarState extends State<MainBottomBarScreen> {
  final List<Widget> _screens = const [
    HomeScreen(),
    CategoriesScreen(),
    CartScreen(),
    WishScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomBarScreenController>(
      builder: (controller) {
        return Scaffold(
          extendBody: true,
          body: _screens[controller.selectedIndex],
          bottomNavigationBar: Container(
            clipBehavior: Clip.hardEdge,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 45),
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomNavItem(
                  index: 0,
                  selectedIndex: controller.selectedIndex,
                  icon: Icons.home_outlined,
                  label: "Home",
                  onTap: controller.switchNavPage,
                ),
                CustomNavItem(
                  index: 1,
                  selectedIndex: controller.selectedIndex,
                  icon: Icons.category_outlined,
                  label: "Categories",
                  onTap: controller.switchNavPage,
                ),
                CustomNavItem(
                  index: 2,
                  selectedIndex: controller.selectedIndex,
                  icon: Icons.shopping_cart_outlined,
                  label: "Cart",
                  onTap: controller.switchNavPage,
                ),
                CustomNavItem(
                  index: 3,
                  selectedIndex: controller.selectedIndex,
                  icon: Icons.card_giftcard,
                  label: "Wish",
                  onTap: controller.switchNavPage,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
