import 'package:shop_nest/core/export/app_widgets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ///------Logo Part------///
            Align(
              alignment: Alignment.center,
              child: SvgPicture.asset(
                AssetsPath.appLogo,
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),

            ///------Button Loading & Text Part------///
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 100,
                      child: LinearProgressIndicator(
                        color: AppColor.primary,
                        minHeight: 7,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: GetBuilder<SplashScreenController>(
                        builder: (controller) {
                          return Text(
                            "Version ${controller.versionCode}",
                            style: const TextStyle(
                              color: AppColor.secondaryText,
                              fontSize: 12,
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
