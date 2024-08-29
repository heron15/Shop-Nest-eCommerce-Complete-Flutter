import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_nest/utils/app_assets.dart';
import 'package:shop_nest/utils/app_color.dart';
import 'package:shop_nest/view/widgets/rich_text_two.dart';

class TopInfo extends StatelessWidget {
  const TopInfo({
    super.key,
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppAssets.appLogo,
            height: 150,
            width: 150,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10),
          RichTextTwo(
            firstText: title,
            secondText: description,
            firstTextColor: AppColor.primaryText,
            secondTextColor: AppColor.grey,
            firstTextSize: 28,
            secondTextSize: 16,
            firstTextFontWeight: FontWeight.w600,
            secondTextFontWeight: FontWeight.w400,
            height: 1.5,
          ),
        ],
      ),
    );
  }
}
