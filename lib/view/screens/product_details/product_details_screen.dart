import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_nest/core/route/app_route.dart';
import 'package:shop_nest/utils/app_assets.dart';
import 'package:shop_nest/utils/app_color.dart';
import 'package:shop_nest/view/screens/product_details/controller/product_details_screen_controller.dart';
import 'package:shop_nest/view/screens/product_details/inner_widget/product_color_item.dart';
import 'package:shop_nest/view/screens/product_details/inner_widget/product_size_item.dart';
import 'package:shop_nest/view/widgets/rich_text_two.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.productDetailsBg,
        title: const Text("Product Details"),
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(bottom: 70),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  productImage(),
                  titleAndCount(),
                  ratingReviewAndFavorite(context),
                  colorSelect(),
                  sizeSelect(),
                  description(),
                ],
              ),
            ),
            priceAndAddCart(),
          ],
        ),
      ),
    );
  }

  ///------price and add cart part------///
  Widget priceAndAddCart() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        alignment: Alignment.centerLeft,
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        decoration: const BoxDecoration(
          color: AppColor.cardBg,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const RichTextTwo(
              firstText: "Price\n",
              secondText: "\$100",
              firstTextColor: AppColor.primaryText,
              secondTextColor: AppColor.primary,
              firstTextSize: 14,
              secondTextSize: 16,
              firstTextFontWeight: FontWeight.w400,
              secondTextFontWeight: FontWeight.w500,
              textAlign: TextAlign.start,
              height: 1.5,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 9),
                decoration: BoxDecoration(
                  color: AppColor.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  "Add Cart",
                  style: TextStyle(
                    color: AppColor.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  ///------product description part------///
  Widget description() {
    return const Padding(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Description",
            style: TextStyle(
              color: AppColor.primaryText,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 3),
          Text(
            "Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator Reference site about Lorem Ipsum, giving Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator Reference site about Lorem Ipsum, giving",
            style: TextStyle(
              color: AppColor.primaryText,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  ///------size select part------///
  Widget sizeSelect() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Size",
            style: TextStyle(
              color: AppColor.primaryText,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 40,
            width: double.maxFinite,
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ProductSizeItem(index: index);
              },
            ),
          ),
        ],
      ),
    );
  }

  ///------Color select part------///
  Widget colorSelect() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Color",
            style: TextStyle(
              color: AppColor.primaryText,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 40,
            width: double.maxFinite,
            child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ProductColorItem(index: index);
              },
            ),
          ),
        ],
      ),
    );
  }

  ///------rating, review & favorite row part------///
  Widget ratingReviewAndFavorite(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          const Icon(
            Icons.star,
            size: 21,
            color: AppColor.star,
          ),
          RichTextTwo(
            firstText: "4.8",
            secondText: "    Review",
            firstTextColor: AppColor.primaryText,
            secondTextColor: AppColor.primary,
            firstTextSize: 16,
            secondTextSize: 16,
            firstTextFontWeight: FontWeight.w400,
            secondTextFontWeight: FontWeight.w400,
            leftPadding: 3,
            onTap: () {
              context.pushNamed(AppRoute.reviewScreen);
            },
          ),
          const SizedBox(width: 5),
          IconButton(
            onPressed: () {},
            padding: const EdgeInsets.all(3),
            style: IconButton.styleFrom(
              backgroundColor: AppColor.primary,
              alignment: Alignment.center,
              minimumSize: const Size(15, 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            icon: const Icon(
              Icons.favorite_border,
              size: 16,
              color: AppColor.white,
            ),
          )
        ],
      ),
    );
  }

  ///------title & product count part------///
  Widget titleAndCount() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
      child: Row(
        children: [
          const Expanded(
            child: Text(
              "Happy New Year Special Deal Save 30%",
              style: TextStyle(
                color: AppColor.primaryText,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: () {},
            padding: const EdgeInsets.all(3),
            style: IconButton.styleFrom(
              backgroundColor: AppColor.primary,
              alignment: Alignment.center,
              minimumSize: const Size(15, 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            icon: const Icon(
              Icons.remove,
              size: 18,
              color: AppColor.white,
            ),
          ),
          const Text(
            "01",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColor.primaryText,
            ),
          ),
          IconButton(
            onPressed: () {},
            padding: const EdgeInsets.all(3),
            style: IconButton.styleFrom(
              backgroundColor: AppColor.primary,
              alignment: Alignment.center,
              minimumSize: const Size(15, 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            icon: const Icon(
              Icons.add,
              size: 18,
              color: AppColor.white,
            ),
          )
        ],
      ),
    );
  }

  ///------product image part------///
  Widget productImage() {
    return GetBuilder<ProductDetailsScreenController>(
      builder: (controller) {
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: double.maxFinite,
              height: 180,
              decoration: const BoxDecoration(
                color: AppColor.productDetailsBg,
              ),
              child: CarouselSlider.builder(
                itemCount: 3,
                options: CarouselOptions(
                  viewportFraction: 1,
                  height: 150,
                  onPageChanged: (index, reason) {
                    controller.setCurrentIndex(index);
                  },
                ),
                itemBuilder: (context, index, pageViewIndex) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Expanded(
                      child: Image.asset(
                        AppAssets.product,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: SmoothPageIndicator(
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
            ),
          ],
        );
      },
    );
  }
}
