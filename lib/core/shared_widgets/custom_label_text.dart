import 'package:best_touch_training/core/utils/app_colors.dart';
import 'package:best_touch_training/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomLabelText extends StatelessWidget {
  final String? text;
  const CustomLabelText({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      style: regularStyle(size: 14, color: AppColors.labelTextColor),
    );
  }
}
