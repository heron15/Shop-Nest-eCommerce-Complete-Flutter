import 'package:flutter/material.dart';
import 'package:shop_nest/utils/app_string.dart';
import 'package:shop_nest/utils/constants.dart';
import 'package:shop_nest/view/widgets/text_form_field_custom.dart';

class AddReviewScreen extends StatefulWidget {
  const AddReviewScreen({super.key});

  @override
  State<AddReviewScreen> createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  TextEditingController _firstNameTextEditingController = TextEditingController();
  TextEditingController _lastNameTextEditingController = TextEditingController();
  TextEditingController _writeReviewTextEditingController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Your Review"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                ///------first name text field part------///
                TextFormFieldCustom(
                  textEditingController: _firstNameTextEditingController,
                  textInputType: TextInputType.name,
                  hintText: AppString.firstName,
                  topPadding: 20,
                  validator: (value) {
                    return Constants.nullAndNotEmpty(
                      value,
                      AppString.pleaseEnterYourFirstName,
                    );
                  },
                ),

                ///------last name text field part------///
                TextFormFieldCustom(
                  textEditingController: _lastNameTextEditingController,
                  textInputType: TextInputType.name,
                  hintText: AppString.lastName,
                  topPadding: 20,
                  validator: (value) {
                    return Constants.nullAndNotEmpty(
                      value,
                      AppString.pleaseEnterYourLastName,
                    );
                  },
                ),

                ///------write review text field part------///
                TextFormFieldCustom(
                  textEditingController: _writeReviewTextEditingController,
                  textInputType: TextInputType.text,
                  hintText: AppString.writeReview,
                  topPadding: 20,
                  bottomPadding: 25,
                  maxLine: 6,
                  validator: (value) {
                    return Constants.nullAndNotEmpty(
                      value,
                      AppString.pleaseWriteYourReview,
                    );
                  },
                ),

                ///------Submit button------///
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {

                    }
                  },
                  child: const Text("Submit"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
