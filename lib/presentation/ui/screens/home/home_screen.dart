import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_nest/core/route/app_route.dart';
import 'package:shop_nest/presentation/state_holders/categories_screen_controller.dart';
import 'package:shop_nest/presentation/state_holders/home_screen_controller.dart';
import 'package:shop_nest/presentation/ui/widgets/handel_data_screen.dart';
import 'package:shop_nest/presentation/ui/widgets/shimmer/home_remark_product_shimmer.dart';
import 'package:shop_nest/utils/api_urls.dart';
import 'package:shop_nest/utils/app_color.dart';
import 'package:shop_nest/utils/app_string.dart';
import 'package:shop_nest/utils/assets_path.dart';
import 'package:shop_nest/presentation/ui/widgets/product_slider.dart';
import 'package:shop_nest/presentation/ui/widgets/data_error/product_slider_error.dart';
import 'package:shop_nest/presentation/ui/widgets/refresh_indicator_custom_container.dart';
import 'package:shop_nest/presentation/ui/widgets/shimmer/all_category_list_shimmer.dart';
import 'package:shop_nest/presentation/ui/widgets/shimmer/product_slider_shimmer.dart';
import 'package:shop_nest/presentation/state_holders/main_bottom_bar_screen_controller.dart';
import 'package:shop_nest/presentation/ui/screens/search/search_screen.dart';
import 'package:shop_nest/presentation/ui/widgets/app_bar_action_item.dart';
import 'package:shop_nest/presentation/ui/widgets/category_item.dart';
import 'package:shop_nest/presentation/ui/widgets/product_item.dart';
import 'package:shop_nest/presentation/ui/widgets/see_all_text.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MainBottomBarScreenController _mainBottomBarScreenController =
      Get.find<MainBottomBarScreenController>();
  final HomeScreenController _homeScreenController = Get.find<HomeScreenController>();
  final CategoriesScreenController _categoriesScreenController =
      Get.find<CategoriesScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomRefreshIndicator(
          builder: (context, child, controller) {
            return RefreshIndicatorCustomContainer(
              controller: controller,
              child: child,
            );
          },
          onRefresh: () async {
            _homeScreenController.getProductSlider();
            _categoriesScreenController.getAllCategory();
            _homeScreenController.getPopularProduct();
            _homeScreenController.getSpecialProduct();
            _homeScreenController.getNewProduct();
          },
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                appBar(),
                searchBar(),
                sliderBanner(),
                allCategory(),
                popular(),
                special(),
                newPart(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///------new part------///
  Widget newPart() {
    return Column(
      children: [
        SeeAllText(
          header: AppString.newPart,
          onTap: () {
            context.pushNamed(
              AppRoute.productView,
              pathParameters: {
                'apiUrl': ApiUrls.newProduct,
                'appBarTitle': "New",
              },
            );
          },
        ),
        Container(
          height: 180,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: GetBuilder<HomeScreenController>(
            builder: (controller) {
              return handleDataScreen(
                controller.newProductInProgress,
                const HomeRemarkProductShimmer(),
                controller.newProductLoadingError,
                () {
                  controller.getNewProduct();
                },
                controller.newProductList,
                ListView.builder(
                  itemCount: controller.newProductList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ProductItem(
                      productViewModel: controller.newProductList[index],
                      icon: Icons.favorite_border,
                      onTapFavorite: () {},
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  ///------special part------///
  Widget special() {
    return Column(
      children: [
        SeeAllText(
          header: AppString.special,
          onTap: () {
            context.pushNamed(
              AppRoute.productView,
              pathParameters: {
                'apiUrl': ApiUrls.specialProduct,
                'appBarTitle': "Special",
              },
            );
          },
        ),
        Container(
          height: 180,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: GetBuilder<HomeScreenController>(
            builder: (controller) {
              return handleDataScreen(
                controller.specialProductInProgress,
                const HomeRemarkProductShimmer(),
                controller.specialProductLoadingError,
                () {
                  controller.getSpecialProduct();
                },
                controller.specialProductList,
                ListView.builder(
                  itemCount: controller.specialProductList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ProductItem(
                      productViewModel: controller.specialProductList[index],
                      icon: Icons.favorite_border,
                      onTapFavorite: () {},
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  ///------popular part------///
  Widget popular() {
    return Column(
      children: [
        SeeAllText(
          header: AppString.popular,
          onTap: () {
            context.pushNamed(
              AppRoute.productView,
              pathParameters: {
                'apiUrl': ApiUrls.popularProduct,
                'appBarTitle': "Popular",
              },
            );
          },
        ),
        Container(
          height: 180,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: GetBuilder<HomeScreenController>(
            builder: (controller) {
              return handleDataScreen(
                controller.popularProductInProgress,
                const HomeRemarkProductShimmer(),
                controller.popularProductLoadingError,
                () {
                  controller.getPopularProduct();
                },
                controller.popularProductList,
                ListView.builder(
                  itemCount: controller.popularProductList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ProductItem(
                      productViewModel: controller.popularProductList[index],
                      icon: Icons.favorite_border,
                      onTapFavorite: () {},
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  ///------all category part------///
  Widget allCategory() {
    return Column(
      children: [
        SeeAllText(
          header: AppString.allCategory,
          onTap: () {
            _mainBottomBarScreenController.switchNavPage(1);
          },
        ),
        Container(
          height: 90,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: GetBuilder<CategoriesScreenController>(
            builder: (controller) {
              int length = controller.allCategoriesList.length;
              return handleDataScreen(
                controller.allCategoriesInProgress,
                const AllCategoryListShimmer(),
                controller.allCategoryLoadingError,
                () {
                  controller.getAllCategory();
                },
                controller.allCategoriesList,
                ListView.builder(
                  itemCount: length > 8 ? 8 : length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CategoryItem(
                      allCategoryModel: controller.allCategoriesList[index],
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  ///------slider banner part------///
  Widget sliderBanner() {
    return GetBuilder<HomeScreenController>(
      builder: (controller) {
        return controller.productSliderInProgress
            ? const ProductSliderShimmer()
            : controller.productSliderLoadingError
                ? ProductSliderError(
                    onTap: () {
                      controller.getProductSlider();
                    },
                  )
                : Column(
                    children: [
                      CarouselSlider.builder(
                        itemCount: controller.productSliderList.length,
                        options: CarouselOptions(
                          viewportFraction: 1,
                          height: 160,
                          autoPlay: false,
                          onPageChanged: (index, reason) {
                            controller.setCurrentIndex(index);
                          },
                        ),
                        itemBuilder: (context, index, pageViewIndex) {
                          return ProductSlider(
                            productSliderModel: controller.productSliderList[index],
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      SmoothPageIndicator(
                        controller: PageController(initialPage: controller.currentIndex),
                        count: controller.productSliderList.length,
                        effect: const WormEffect(
                          activeDotColor: AppColor.primary,
                          dotColor: AppColor.grey,
                          strokeWidth: 1.1,
                          paintStyle: PaintingStyle.stroke,
                          dotWidth: 11,
                          dotHeight: 11,
                        ),
                      ),
                    ],
                  );
      },
    );
  }

  ///------search bar section------///
  Widget searchBar() {
    return GestureDetector(
      onTap: () {
        showSearch(
          context: context,
          delegate: SearchScreen(),
        );
      },
      child: Container(
        width: double.maxFinite,
        height: 50,
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: AppColor.greySecondary,
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.search,
              color: AppColor.grey,
            ),
            SizedBox(width: 10),
            Text(
              "Search",
              style: TextStyle(
                color: AppColor.grey,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///------app bar section------///
  Widget appBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            AssetsPath.appBarLogo,
            fit: BoxFit.cover,
            width: 115,
          ),
          Row(
            children: [
              AppBarActionItem(
                icon: Icons.person_outline,
                onTap: () {
                  context.pushNamed(AppRoute.loginScreen);
                },
              ),
              AppBarActionItem(
                icon: Icons.call_outlined,
                onTap: () {},
              ),
              AppBarActionItem(
                icon: Icons.notifications_on_outlined,
                onTap: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
