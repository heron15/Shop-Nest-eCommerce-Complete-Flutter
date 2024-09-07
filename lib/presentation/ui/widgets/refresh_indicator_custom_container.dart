import 'package:shop_nest/core/export/app_widgets.dart';

class RefreshIndicatorCustomContainer extends StatelessWidget {
  const RefreshIndicatorCustomContainer({
    super.key,
    required this.controller,
    required this.child,
  });

  final IndicatorController controller;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        if (!controller.isIdle)
          Positioned(
            top: 35.0 * controller.value,
            child: const SizedBox(
              height: 30,
              width: 30,
              child: CenterProgressIndicator(
                indicatorSize: 30,
              ),
            ),
          ),
        Transform.translate(
          offset: Offset(0, 100.0 * controller.value),
          child: child,
        ),
      ],
    );
  }
}
