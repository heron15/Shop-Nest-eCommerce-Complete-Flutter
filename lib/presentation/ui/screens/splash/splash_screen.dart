import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shop_nest/presentation/state_holders/splash_screen_controller.dart';
import 'package:shop_nest/utils//app_color.dart';
import 'package:shop_nest/utils//assets_path.dart';

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
