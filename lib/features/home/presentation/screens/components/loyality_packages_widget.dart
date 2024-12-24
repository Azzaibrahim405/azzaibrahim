import 'package:best_touch_training/core/utils/app_colors.dart';
import 'package:best_touch_training/core/utils/app_text_style.dart';
import 'package:best_touch_training/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class LoyalityPackagesWidget extends StatelessWidget {
  LoyalityPackagesWidget(
      {super.key, required this.title, required this.image, this.onTap});
  final String title;
  final String image;
  Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 5,
        color: Colors.white,
        child: Column(
          children: [
            Align(
                alignment: Alignment.topRight,
                child: Text(
                  title,
                  style:
                      regularStyle(size: 18, color: AppColors.labelTextColor),
                )).paddingAll(5),
            10.verticalSpace,
            Align(alignment: Alignment.bottomLeft, child: Image.asset(image))
          ],
        ),
      ),
    );
  }
}
