import 'package:shop_nest/core/export/app_widgets.dart';

class HomeRemarkProductShimmer extends StatelessWidget {
  const HomeRemarkProductShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerWidget(
      child: ListView.builder(
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return FittedBox(
            child: Container(
              width: 130,
              height: 150,
              margin: const EdgeInsets.symmetric(horizontal: 3),
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          );
        },
      ),
    );
  }
}
