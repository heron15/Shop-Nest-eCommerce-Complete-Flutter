import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shop_nest/utils/app_color.dart';

class CenterProgressIndicator extends StatelessWidget {
  const CenterProgressIndicator({
    super.key,
    this.indicatorSize = 40,
    this.indicatorColor = AppColor.primary,
  });

  final double indicatorSize;
  final Color indicatorColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.hexagonDots(
        size: indicatorSize,
        color: indicatorColor,
      ),
    );
  }
}
