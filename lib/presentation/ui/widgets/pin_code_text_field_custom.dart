import 'package:shop_nest/core/export/app_widgets.dart';

class PinCodeTextFieldCustom extends StatelessWidget {
  const PinCodeTextFieldCustom({
    super.key,
    required this.pinVerificationTextEditingController,
  });

  final TextEditingController pinVerificationTextEditingController;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      length: 4,
      obscureText: false,
      animationType: AnimationType.fade,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      mainAxisAlignment: MainAxisAlignment.center,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 40,
        activeFillColor: Colors.white,
        selectedFillColor: AppColor.white,
        inactiveFillColor: AppColor.white,
        selectedColor: AppColor.primary,
        inactiveColor: AppColor.primary,
        activeColor: AppColor.primary,
        fieldOuterPadding: const EdgeInsets.symmetric(horizontal: 5),
      ),
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.transparent,
      enableActiveFill: true,
      controller: pinVerificationTextEditingController,
      keyboardType: TextInputType.number,
      appContext: context,
    );
  }
}
