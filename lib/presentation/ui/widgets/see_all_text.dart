

import 'package:shop_nest/core/export/app_widgets.dart';

class SeeAllText extends StatelessWidget {
  const SeeAllText({super.key, required this.header, required this.onTap});

  final String header;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            header,
            style: const TextStyle(
              color: AppColor.primaryText,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          InkWell(
            onTap: onTap,
            child: const Text(
              "See All",
              style: TextStyle(
                color: AppColor.primary,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
