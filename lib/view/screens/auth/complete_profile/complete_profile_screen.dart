import 'package:flutter/material.dart';
import 'package:shop_nest/core/route/app_route.dart';
import 'package:shop_nest/utils/app_string.dart';
import 'package:shop_nest/utils/validation_checking.dart';
import 'package:shop_nest/view/widgets/text_form_field_custom.dart';
import 'package:shop_nest/view/widgets/top_info.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final TextEditingController _firstNameTextEditingController = TextEditingController();
  final TextEditingController _lastNameTextEditingController = TextEditingController();
  final TextEditingController _mobileTextEditingController = TextEditingController();
  final TextEditingController _cityTextEditingController = TextEditingController();
  final TextEditingController _shippingAddressTextEditingController = TextEditingController();

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
              const SizedBox(height: 5),

              ///------Top icon, title & description part------///
              const TopInfo(
                title: AppString.completeProfile,
                description: AppString.getStartedWithUsWithYourDetails,
              ),

              Form(
                key: _formKey,
                child: Column(
                  children: [
                    ///------First name text field------///
                    TextFormFieldCustom(
                      textEditingController: _firstNameTextEditingController,
                      textInputType: TextInputType.name,
                      hintText: AppString.firstName,
                      topPadding: 20,
                      validator: (value) {
                        return ValidationChecking.nullAndNotEmpty(
                          value,
                          AppString.pleaseEnterYourFirstName,
                        );
                      },
                    ),

                    ///------Last name text field------///
                    TextFormFieldCustom(
                      textEditingController: _lastNameTextEditingController,
                      textInputType: TextInputType.name,
                      hintText: AppString.lastName,
                      topPadding: 20,
                      validator: (value) {
                        return ValidationChecking.nullAndNotEmpty(
                          value,
                          AppString.pleaseEnterYourLastName,
                        );
                      },
                    ),

                    ///------Mobile text field------///
                    TextFormFieldCustom(
                      textEditingController: _mobileTextEditingController,
                      textInputType: TextInputType.number,
                      hintText: AppString.mobile,
                      topPadding: 20,
                      validator: (value) {
                        return ValidationChecking.nullAndNotEmpty(
                          value,
                          AppString.pleaseEnterYourMobileNumber,
                        );
                      },
                    ),

                    ///------City name text field------///
                    TextFormFieldCustom(
                      textEditingController: _cityTextEditingController,
                      textInputType: TextInputType.text,
                      hintText: AppString.city,
                      topPadding: 20,
                      validator: (value) {
                        return ValidationChecking.nullAndNotEmpty(
                          value,
                          AppString.pleaseEnterYourCity,
                        );
                      },
                    ),

                    ///------Shipping Address name text field------///
                    TextFormFieldCustom(
                      textEditingController: _shippingAddressTextEditingController,
                      textInputType: TextInputType.text,
                      hintText: AppString.shippingAddress,
                      topPadding: 20,
                      bottomPadding: 20,
                      maxLine: 3,
                      validator: (value) {
                        return ValidationChecking.nullAndNotEmpty(
                          value,
                          AppString.pleaseEnterYourShippingAddress,
                        );
                      },
                    ),
                  ],
                ),
              ),

              ///------Complete button------///
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _gotoHomeScreen();
                  }
                },
                child: const Text(
                  AppString.complete,
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  void _gotoHomeScreen() {
    AppRoute.removePreviousPageAndGo(context, AppRoute.mainBottomBarScreen);
  }
}
