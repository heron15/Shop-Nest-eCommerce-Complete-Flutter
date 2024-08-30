import 'package:flutter/material.dart';
import 'package:shop_nest/utils/app_assets.dart';
import 'package:shop_nest/view/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: GridView.builder(
            itemCount: 9,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 10,
              crossAxisSpacing: 1,
              childAspectRatio: 1 / 1.1,
            ),
            itemBuilder: (context, constraints) {
              return const CategoryItem(
                image: AppAssets.category,
                title: "Food",
              );
            },
          ),
        ),
      ),
    );
  }
}
