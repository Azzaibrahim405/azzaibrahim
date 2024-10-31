import 'package:best_touch_training/core/utils/app_colors.dart';
import 'package:best_touch_training/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String? text;
  final Function()? onPress;
  final Color? textColor;
  final bool isUnderline;

  const CustomTextButton(
      {super.key,
      this.text,
      this.onPress,
      this.isUnderline = false,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      child: Text(
        text ?? '',
        style: semiBold(size: 14, color: textColor ?? AppColors.primary)
            .copyWith(
                decoration: isUnderline
                    ? TextDecoration.underline
                    : TextDecoration.none),
      ),
    );
  }
}
