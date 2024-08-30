import 'package:flutter/material.dart';
import 'package:shop_nest/utils/app_color.dart';
import 'package:shop_nest/view/screens/cart/inner_widget/cart_item.dart';
import 'package:shop_nest/view/widgets/rich_text_two.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 80),
              child: Expanded(
                child: ListView.builder(
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return const CartItem();
                  },
                ),
              ),
            ),
            Align(
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
                      firstText: "Total Price\n",
                      secondText: "\$1,000,00.00",
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
                          "Checkout",
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
            ),
          ],
        ),
      ),
    );
  }
}
