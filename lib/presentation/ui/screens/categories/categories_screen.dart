

import 'package:shop_nest/core/export/app_widgets.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final CategoriesScreenController _categoriesScreenController =
      Get.find<CategoriesScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
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
            _categoriesScreenController.getAllCategory();
          },
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            physics: const AlwaysScrollableScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: Constants.screenHeight - 200),
              child: GetBuilder<CategoriesScreenController>(
                builder: (controller) {
                  return handleDataScreen(
                    controller.allCategoriesInProgress,
                    const CenterProgressIndicator(),
                    controller.allCategoryLoadingError,
                    () {
                      controller.getAllCategory();
                    },
                    controller.allCategoriesList,
                    GridView.count(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 4,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 1,
                      childAspectRatio: 1 / 1.1,
                      children: List.generate(
                        controller.allCategoriesList.length,
                        (index) {
                          return CategoryItem(
                            allCategoryModel: controller.allCategoriesList[index],
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
