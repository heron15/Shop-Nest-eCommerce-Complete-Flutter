import 'package:shop_nest/core/export/app_widgets.dart';

Widget handleDataScreen(
  bool dataInProgress,
  Widget loadingIndicatorChild,
  bool dataLoadingError,
  VoidCallback ontTap,
  List<dynamic> list,
  Widget mailChild,
) {
  return dataInProgress
      ? loadingIndicatorChild
      : dataLoadingError
          ? DataLoadingError(
              onTap: ontTap,
            )
          : list.isEmpty
              ? const NoDataAvailable()
              : mailChild;
}
