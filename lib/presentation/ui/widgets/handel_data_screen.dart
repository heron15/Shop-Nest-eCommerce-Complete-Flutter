import 'package:flutter/material.dart';
import 'package:shop_nest/presentation/ui/widgets/data_error/data_loading_error.dart';
import 'package:shop_nest/presentation/ui/widgets/no_data_available.dart';

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
