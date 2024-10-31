import 'package:best_touch_training/core/locale/app_locale.dart';
import 'package:best_touch_training/core/utils/app_colors.dart';
import 'package:best_touch_training/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomTitleText extends StatelessWidget {
  final String text;
  const CustomTitleText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text.tr(context),
        style: boldStyle(color: AppColors.labelTextColor, size: 24));
  }
}
