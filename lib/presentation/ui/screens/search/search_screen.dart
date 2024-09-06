import 'package:flutter/material.dart';
import 'package:shop_nest/utils//app_color.dart';

class SearchScreen extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      indicatorColor: AppColor.primary,
      scaffoldBackgroundColor: AppColor.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColor.white,
        elevation: 0.5,
        surfaceTintColor: AppColor.white,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: AppColor.grey),
        border: InputBorder.none,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          color: AppColor.primaryText,
        ),
        headlineMedium: TextStyle(
          color: AppColor.primaryText,
        ),
      ),
    );
  }
}
