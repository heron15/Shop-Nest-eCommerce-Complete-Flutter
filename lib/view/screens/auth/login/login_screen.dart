import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_nest/core/route/app_route.dart';
import 'package:shop_nest/utils/app_string.dart';
import 'package:shop_nest/utils/constants.dart';
import 'package:shop_nest/view/widgets/text_form_field_custom.dart';
import 'package:shop_nest/view/widgets/top_info.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailTextEditingController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                title: AppString.welcomeBack,
                description: AppString.pleaseEnterYourEmailAddress,
              ),

              ///------Enter email address text field part------///
              Form(
                key: _formKey,
                child: TextFormFieldCustom(
                  textEditingController: _emailTextEditingController,
                  textInputType: TextInputType.emailAddress,
                  hintText: AppString.emailAddress,
                  topPadding: 20,
                  bottomPadding: 20,
                  validator: (value) {
                    return Constants.validateEmail(value);
                  },
                ),
              ),

              ///------Next button------///
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _goToOtpVerifyScreen();
                  }
                },
                child: const Text(
                  AppString.next,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _goToOtpVerifyScreen() {
    context.pushNamed(AppRoute.otpVerifyScreen);
  }
}
