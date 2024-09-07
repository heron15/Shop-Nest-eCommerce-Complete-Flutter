import 'package:shop_nest/core/export/app_widgets.dart';

class DataLoadingError extends StatelessWidget {
  const DataLoadingError({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            AppString.errorForLoadingData,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          InkWell(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
              margin: const EdgeInsets.only(top: 7),
              decoration: BoxDecoration(
                color: AppColor.productDetailsBg,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Text(
                "Try again",
                style: TextStyle(color: AppColor.primaryText),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
