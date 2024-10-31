import 'package:best_touch_training/core/utils/app_colors.dart';
import 'package:best_touch_training/core/utils/app_text_style.dart';
import 'package:best_touch_training/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDialogWidget extends StatelessWidget {
  final String image;
  final String title;
  const CustomDialogWidget(
      {super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 200), () {
      Navigator.of(context).pop(); // Closes the dialog
    });
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              maxLines: 1, // Limits text to one line
              overflow: TextOverflow.ellipsis,
              title,
              style: semiBold(size: 24, color: AppColors.deepGrey),
            ),
          ),
          20.verticalSpace,
          Image.asset(
            image,
          )
        ],
      ).paddingSymmetric(50, 30),
    );
  }
}
