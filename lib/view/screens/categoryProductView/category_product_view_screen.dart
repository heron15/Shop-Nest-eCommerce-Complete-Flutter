import 'package:flutter/material.dart';
import 'package:shop_nest/utils/app_assets.dart';
import 'package:shop_nest/view/widgets/product_item.dart';

class CategoryProductViewScreen extends StatelessWidget {
  const CategoryProductViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wish List"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: GridView.builder(
            itemCount: 9,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 1,
              crossAxisSpacing: 1,
              childAspectRatio: 1 / 1.18,
            ),
            itemBuilder: (context, constraints) {
              return ProductItem(
                image: AppAssets.product,
                title: "Food",
                price: "\$100",
                star: "4.6",
                icon: Icons.delete_outline,
                onTapFavorite: () {},
              );
            },
          ),
        ),
      ),
    );
  }
}
