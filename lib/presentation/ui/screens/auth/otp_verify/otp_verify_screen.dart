import 'package:shop_nest/core/export/app_widgets.dart';

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({super.key});

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  final TextEditingController _otpVerificationTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 100),

              ///------Top icon, title & description part------///
              const TopInfo(
                title: AppString.enterOtpCode,
                description: AppString.a4DigitCodeHasBeenSent,
              ),
              const SizedBox(height: 25),

              ///------Pin code text field part------///
              PinCodeTextFieldCustom(
                pinVerificationTextEditingController: _otpVerificationTextEditingController,
              ),
              const SizedBox(height: 10),

              ///------Next button part------///
              ElevatedButton(
                onPressed: () {
                  if (_otpVerificationTextEditingController.text.length != 4) {
                    showToast(
                      AppString.pleaseEnter6DigitPin,
                      AppColor.red,
                      AppColor.white,
                      ToastGravity.TOP,
                    );
                  } else {
                    _goToCompleteProfileScreen();
                  }
                },
                child: const Text(AppString.next),
              ),

              ///------Time count text part------///
              const RichTextTwo(
                firstText: AppString.thisCodeWillExpireIn,
                secondText: "60s",
                firstTextColor: AppColor.grey,
                secondTextColor: AppColor.primary,
                firstTextSize: 16,
                secondTextSize: 16,
                firstTextFontWeight: FontWeight.w400,
                secondTextFontWeight: FontWeight.w400,
                topPadding: 30,
                bottomPadding: 10,
              ),

              ///------Resend code button part------///
              InkWell(
                onTap: () {},
                child: const Text(
                  AppString.resendCode,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: AppColor.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _goToCompleteProfileScreen() {
    context.pushNamed(AppRoute.completeProfileScreen);
  }
}
