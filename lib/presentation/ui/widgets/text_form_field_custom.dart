import 'package:flutter/material.dart';
import 'package:shop_nest/utils/app_color.dart';

class TextFormFieldCustom extends StatefulWidget {
  const TextFormFieldCustom({
    super.key,
    required this.textEditingController,
    required this.textInputType,
    required this.hintText,
    this.showSuffixIcon = false,
    required this.validator,
    this.topPadding = 0,
    this.bottomPadding = 0,
    this.obscureText = false,
    this.maxLine = 1,
    this.enabled = true,
  });

  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final String hintText;
  final bool showSuffixIcon;
  final String? Function(String? value) validator;
  final double topPadding;
  final double bottomPadding;
  final bool obscureText;
  final int maxLine;
  final bool enabled;

  @override
  State<TextFormFieldCustom> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<TextFormFieldCustom> {
  bool _obscureText = false;

  @override
  void initState() {
    _obscureText = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: widget.topPadding, bottom: widget.bottomPadding),
      child: TextFormField(
        onTapOutside: (value) {
          FocusScope.of(context).unfocus();
        },
        controller: widget.textEditingController,
        keyboardType: widget.textInputType,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        cursorColor: AppColor.primary,
        obscureText: _obscureText,
        maxLines: widget.maxLine,
        enabled: widget.enabled,
        decoration: InputDecoration(
          fillColor: AppColor.white,
          filled: true,
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            color: AppColor.grey,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              width: 1.5,
              color: AppColor.primary,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              width: 1.5,
              color: AppColor.primary,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              width: 1.5,
              color: AppColor.primary,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              width: 1.5,
              color: AppColor.red,
            ),
          ),
          suffixIcon: Visibility(
            visible: widget.showSuffixIcon,
            child: IconButton(
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              icon: Icon(
                _obscureText ? Icons.visibility : Icons.visibility_off,
                color: AppColor.grey,
              ),
            ),
          ),
        ),
        validator: widget.validator,
      ),
    );
  }
}
