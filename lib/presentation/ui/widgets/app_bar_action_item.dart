import 'package:shop_nest/core/export/app_widgets.dart';

class AppBarActionItem extends StatelessWidget {
  const AppBarActionItem({super.key, required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: AppColor.greySecondary,
        ),
        child: Icon(
          icon,
          size: 23,
          color: AppColor.primaryText,
        ),
      ),
    );
  }
}
