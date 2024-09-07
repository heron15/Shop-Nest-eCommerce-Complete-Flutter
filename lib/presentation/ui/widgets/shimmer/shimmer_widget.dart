import 'package:shop_nest/core/export/app_widgets.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColor.simmerBgColor,
      highlightColor: AppColor.simmerItemColor,
      child: child,
    );
  }
}
