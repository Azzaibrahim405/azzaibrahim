import 'package:best_touch_training/core/utils/app_colors.dart';
import 'package:best_touch_training/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  final String? text;
  final Function()? onPress;
  final double? width;
  final double? height;
  final Color textColor;
  final Color? color;
  final Color? borderColor;
  const CustomElevatedButton(
      {super.key,
      this.text,
      this.onPress,
      this.height,
      this.color,
      this.width,
      this.borderColor,
      this.textColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 49.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            side: BorderSide(color: borderColor ?? Colors.transparent),
            backgroundColor: color ?? AppColors.primary),
        onPressed: onPress,
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            text ?? '',
            style: semiBold(size: 16, color: textColor),
          ),
        ),
      ),
    );
  }
}
