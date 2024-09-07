

import 'package:shop_nest/core/export/app_widgets.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            productList(),
            totalPriceCard(),
          ],
        ),
      ),
    );
  }

  ///------Total price and checkout card part------///
  Widget totalPriceCard() {
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
            return const CartItem();
          },
        ),
      ),
    );
  }
}
