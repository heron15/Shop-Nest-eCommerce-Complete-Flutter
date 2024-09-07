

import 'package:shop_nest/core/export/app_widgets.dart';


class AllCategoryListShimmer extends StatelessWidget {
  const AllCategoryListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerWidget(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ListView.builder(
          itemCount: 7,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return FittedBox(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    Container(
                      width: 60,
                      height: 8,
                      margin: const EdgeInsets.only(top: 5),
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(15),
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
