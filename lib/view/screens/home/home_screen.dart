import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shop_nest/utils/app_assets.dart';
import 'package:shop_nest/utils/app_color.dart';
import 'package:shop_nest/utils/app_string.dart';
import 'package:shop_nest/view/screens/home/controller/home_screen_controller.dart';
import 'package:shop_nest/view/screens/home/inner_widget/slider_banner.dart';
import 'package:shop_nest/view/screens/main_bottom_bar/controller/main_bottom_bar_screen_controller.dart';
import 'package:shop_nest/view/screens/search/search_screen.dart';
import 'package:shop_nest/view/widgets/app_bar_action_item.dart';
import 'package:shop_nest/view/widgets/category_item.dart';
import 'package:shop_nest/view/widgets/product_item.dart';
import 'package:shop_nest/view/widgets/see_all_text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MainBottomBarScreenController _mainBottomBarScreenController =
      Get.find<MainBottomBarScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
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
    );
  }

  ///------new part------///
  Widget newPart() {
    return Column(
      children: [
        SeeAllText(
          header: AppString.newPart,
          onTap: () {},
        ),
        Container(
          height: 180,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: ListView.builder(
            itemCount: 7,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ProductItem(
                image: AppAssets.product,
                title: "New Year Special Shoe",
                price: "\$ 2000",
                star: "4.8",
                icon: Icons.favorite_border,
                onTapFavorite: () {},
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
          onTap: () {},
        ),
        Container(
          height: 180,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: ListView.builder(
            itemCount: 7,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ProductItem(
                image: AppAssets.product,
                title: "New Year Special Shoe",
                price: "\$ 2000",
                star: "4.8",
                icon: Icons.favorite_border,
                onTapFavorite: () {},
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
          onTap: () {},
        ),
        Container(
          height: 180,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: ListView.builder(
            itemCount: 7,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ProductItem(
                image: AppAssets.product,
                title: "New Year Special Shoe",
                price: "\$ 2000",
                star: "4.8",
                icon: Icons.favorite_border,
                onTapFavorite: () {},
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
          child: ListView.builder(
            itemCount: 7,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return const CategoryItem(
                image: AppAssets.category,
                title: "Food Food Food",
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
        return Column(
          children: [
            CarouselSlider.builder(
              itemCount: 3,
              options: CarouselOptions(
                viewportFraction: 1,
                height: 160,
                autoPlay: true,
                onPageChanged: (index, reason) {
                  controller.setCurrentIndex(index);
                },
              ),
              itemBuilder: (context, index, pageViewIndex) {
                return const SliderBanner(
                  image: AppAssets.product,
                  title: "Happy New Year\r\nSpecial Deal \r\nSave 30%",
                );
              },
            ),
            const SizedBox(height: 10),
            SmoothPageIndicator(
              controller: PageController(initialPage: controller.currentIndex),
              count: 3,
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
            AppAssets.appBarLogo,
            fit: BoxFit.cover,
            width: 115,
          ),
          Row(
            children: [
              AppBarActionItem(
                icon: Icons.person_outline,
                onTap: () {},
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
