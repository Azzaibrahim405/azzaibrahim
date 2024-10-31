import 'package:best_touch_training/core/utils/app_colors.dart';
import 'package:best_touch_training/core/utils/app_images.dart';
import 'package:best_touch_training/core/utils/app_text_style.dart';
import 'package:best_touch_training/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomInfoCardWidget extends StatelessWidget {
  final String leadingImage;
  final String title;
  final Widget? isTrailing;
  const CustomInfoCardWidget({
    super.key,
    required this.leadingImage,
    required this.title,
    this.isTrailing,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 1,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(leadingImage),
                16.horizontalSpace,
                Text(title,
                    style: regularStyle(
                        size: 14, color: AppColors.labelTextColor)),
              ],
            ),
            isTrailing ?? SvgPicture.asset(AppAssets.arrowIosLeft),
          ],
        ).paddingAll(10),
      ).paddingVertical(16),
    );
  }
}
