import 'package:shop_nest/core/export/app_widgets.dart';

class NoDataAvailable extends StatelessWidget {
  const NoDataAvailable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        AppString.noDataAvailable,
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }
}
