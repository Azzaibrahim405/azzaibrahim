//

import 'package:best_touch_training/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatefulWidget {
  final String? hint;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final int? maxLines;
  final bool isPassword;
  final int? maxLength;
  final Widget? helper;
  final Color? fillColor;
  final bool isEnable;
  final Widget? prefix;
  final Widget? suffix;
  Function(String)? onChange;
  final Widget? label;
  final EdgeInsets? contentPadding;
  final TextStyle? hintStyle;

  CustomTextFormField({
    this.label,
    super.key,
    this.hint,
    required this.controller,
    this.validator,
    this.suffix,
    this.fillColor,
    this.isEnable = true,
    this.maxLines,
    this.prefix,
    this.onChange,
    this.isPassword = false,
    this.maxLength,
    this.helper,
    this.contentPadding,
    this.hintStyle,
  });

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late final ValueNotifier<bool> isObscureNotifier;
  late final ValueNotifier<bool> isFocusedNotifier;

  @override
  void initState() {
    super.initState();
    isObscureNotifier = ValueNotifier<bool>(true);
    isFocusedNotifier = ValueNotifier<bool>(false);
  }

  @override
  void dispose() {
    isObscureNotifier.dispose();
    isFocusedNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isFocusedNotifier,
      builder: (context, isFocused, child) {
        return ValueListenableBuilder<bool>(
          valueListenable: isObscureNotifier,
          builder: (context, isObscure, child) {
            return TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onChanged: (value) => widget.onChange,
              controller: widget.controller,
              validator: widget.validator,
              obscureText: widget.isPassword ? isObscure : false,
              enabled: widget.isEnable,
              decoration: InputDecoration(
                filled: true,

                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.hintColor),
                  borderRadius: BorderRadius.circular(
                      4.0), // You can customize the radius
                ),
                // Border when the field is focused
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: AppColors.hintColor,
                  ),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                // Border when there's an error
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: AppColors.hintColor,
                  ),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                // Border when the field is focused and there's an error
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: AppColors.hintColor,
                  ),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                fillColor: widget.fillColor ?? Colors.white,
                suffixIcon: widget.isPassword
                    ? IconButton(
                        onPressed: () {
                          isObscureNotifier.value = !isObscureNotifier.value;
                        },
                        icon: isObscure
                            ? const Icon(Icons.visibility_off_outlined)
                            : const Icon(Icons.visibility_outlined),
                      )
                    : widget.suffix,
                prefixIcon: widget.prefix,
                // contentPadding: widget.contentPadding ??
                //     EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(4.r),
                //   borderSide: BorderSide.none,
                // ),
                hintStyle: widget.hintStyle,
                hintText: widget.hint,
              ),
              // maxLines: widget.maxLines,
            );
          },
        );
      },
    );
  }
}
