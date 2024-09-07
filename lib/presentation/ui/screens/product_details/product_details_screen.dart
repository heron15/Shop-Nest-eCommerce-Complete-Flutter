import 'package:shop_nest/core/export/app_widgets.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({
    super.key,
    required this.id,
  });

  final String id;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final ProductDetailsScreenController _productDetailsScreenController =
      Get.find<ProductDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    _productDetailsScreenController.getProductDetails(ApiUrls.productDetailsById(widget.id));
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.productDetailsBg,
        title: const Text("Product Details"),
      ),
      body: SafeArea(
        child: CustomRefreshIndicator(
          builder: (context, child, controller) {
            return RefreshIndicatorCustomContainer(
              controller: controller,
              child: child,
            );
          },
          onRefresh: () async {
            _productDetailsScreenController.getProductDetails(
              ApiUrls.productDetailsById(widget.id),
            );
          },
          child: GetBuilder<ProductDetailsScreenController>(
            builder: (controller) {
              if (controller.productDetailsInProgress) {
                return const CenterProgressIndicator();
              } else {
                if (controller.productDetailsLoadingError) {
                  return DataLoadingError(
                    onTap: () {
                      controller.getProductDetails(
                        ApiUrls.productDetailsById(widget.id),
                      );
                    },
                  );
                } else {
                  return Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        padding: const EdgeInsets.only(bottom: 70),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(minHeight: Constants.screenHeight - 200),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              productImage(controller),
                              titleAndCount(controller),
                              ratingReviewAndFavorite(context, controller),
                              colorSelect(controller),
                              sizeSelect(controller),
                              description(controller),
                            ],
                          ),
                        ),
                      ),
                      priceAndAddCart(controller),
                    ],
                  );
                }
              }
            },
          ),
        ),
      ),
    );
  }

  ///------price and add cart part------///
  Widget priceAndAddCart(ProductDetailsScreenController controller) {
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
            RichTextTwo(
              firstText: "Price\n",
              secondText: controller.productDetailsModel.product!.price!,
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
  Widget description(ProductDetailsScreenController controller) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Description",
            style: TextStyle(
              color: AppColor.primaryText,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            controller.productDetailsModel.des ?? '',
            style: const TextStyle(
              color: AppColor.primaryText,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  ///------size select part------///
  Widget sizeSelect(ProductDetailsScreenController controller) {
    List<String> productSize = controller.productDetailsModel.size!.split(RegExp(r'[,.]'));
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
              itemCount: productSize.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ProductSizeItem(
                  index: index,
                  productSize: productSize[index],
                  controller: controller,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  ///------Color select part------///
  Widget colorSelect(ProductDetailsScreenController controller) {
    List<String> color = controller.productDetailsModel.color!.split(',');
    List<Color> productColor =
        color.map((c) => Color(int.parse(c.replaceFirst('#', '0xff')))).toList();
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
              itemCount: productColor.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ProductColorItem(
                  index: index,
                  color: productColor[index],
                  controller: controller,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  ///------rating, review & favorite row part------///
  Widget ratingReviewAndFavorite(BuildContext context, ProductDetailsScreenController controller) {
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
            firstText: controller.productDetailsModel.product!.star!.toStringAsFixed(1),
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
  Widget titleAndCount(ProductDetailsScreenController controller) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              controller.productDetailsModel.product!.title ?? '',
              style: const TextStyle(
                color: AppColor.primaryText,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: () {
              controller.quantityDecrease();
            },
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
          Text(
            controller.quantity.toString(),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColor.primaryText,
            ),
          ),
          IconButton(
            onPressed: () {
              controller.quantityIncrease();
            },
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
          ),
        ],
      ),
    );
  }

  ///------product image part------///
  Widget productImage(ProductDetailsScreenController controller) {
    List<String> imgUrl = [
      controller.productDetailsModel.img1 ?? '',
      controller.productDetailsModel.img2 ?? '',
      controller.productDetailsModel.img3 ?? '',
      controller.productDetailsModel.img4 ?? '',
    ];
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
            itemCount: 4,
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
                child: FittedBox(
                  child: CachedNetworkImage(
                    imageUrl: imgUrl[index],
                    fit: BoxFit.fitWidth,
                    placeholder: (context, url) {
                      return const CenterProgressIndicator(
                        indicatorColor: AppColor.primary,
                        indicatorSize: 25,
                      );
                    },
                    errorWidget: (context, url, error) {
                      return SvgPicture.asset(
                        AssetsPath.errorImage,
                        fit: BoxFit.fitHeight,
                        color: AppColor.primary,
                      );
                    },
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
            count: 4,
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
  }
}
