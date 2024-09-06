import 'package:flutter/material.dart';
import 'package:shop_nest/data/model/product_model.dart';

import 'package:shop_nest/presentation/ui/widgets/product_item.dart';

class WishScreen extends StatelessWidget {
  const WishScreen({super.key});

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
            physics: const BouncingScrollPhysics(),
            itemCount: 9,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 1,
              crossAxisSpacing: 1,
              childAspectRatio: 1 / 1.18,
            ),
            itemBuilder: (context, constraints) {
              return ProductItem(
                productViewModel: ProductModel(),
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
