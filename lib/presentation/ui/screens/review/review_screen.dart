import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_nest/core/route/app_route.dart';
import 'package:shop_nest/utils//app_color.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reviews"),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            productList(),
            totalPriceCard(context),
          ],
        ),
      ),
    );
  }

  ///------Total price and checkout card part------///
  Widget totalPriceCard(BuildContext context) {
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
            const Text(
              "Total Reviews: (100)",
              style: TextStyle(
                color: AppColor.primaryText,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
            GestureDetector(
              onTap: () {
                context.pushNamed(AppRoute.addReviewScreen);
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColor.primary,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Icon(
                  Icons.add,
                  size: 25,
                  color: AppColor.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  ///------Product list part------///
  Widget productList() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 80),
      child: Expanded(
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 7,
          itemBuilder: (context, index) {
            return Card(
              color: AppColor.white,
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColor.grey.withAlpha(100),
                          radius: 14,
                          child: const Icon(
                            Icons.person_outline,
                            size: 17,
                            color: AppColor.primaryText,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "Heronmoy Biswas",
                          style: TextStyle(
                            color: AppColor.primaryText,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      "Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator Reference site about Lorem Ipsum, giving Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator Reference site about Lorem Ipsum, giving",
                      style: TextStyle(
                        color: AppColor.primaryText,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
