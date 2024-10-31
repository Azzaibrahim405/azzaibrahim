import 'package:best_touch_training/core/utils/app_colors.dart';
import 'package:best_touch_training/core/utils/app_images.dart';
import 'package:best_touch_training/core/utils/app_text_style.dart';
import 'package:best_touch_training/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

class LoyalityItem extends StatelessWidget {
  const LoyalityItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 5,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.greyLight,
                    ),
                    borderRadius: BorderRadius.circular(8)),
                child: Image.asset(AppAssets.rewards).paddingAll(5),
              ),
              6.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'المغسلة المتميزة',
                    style: boldStyle(color: AppColors.labelTextColor, size: 16),
                  ),
                  6.verticalSpace,
                  Text(
                    'سيارة صغيرة - غسله عادية',
                    style: regularStyle(size: 14, color: AppColors.greyColor),
                  )
                ],
              )
            ],
          ),
          20.verticalSpace,
          Directionality(
            textDirection: TextDirection.ltr,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.centerRight,
              children: [
                Transform.flip(
                  flipX: false,
                  child: LinearProgressBar(
                    minHeight: 8,

                    maxSteps: 5,
                    progressType: LinearProgressBar
                        .progressTypeLinear, // Use Linear progress
                    currentStep: 2,
                    progressColor: AppColors.primary,
                    backgroundColor: AppColors.linerProgressColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Positioned.directional(
                  textDirection: Directionality.of(context),
                  top: -25.h,
                  start: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        AppAssets.gift2,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
                LinearProgressBar(
                  minHeight: 8,

                  maxSteps: 5,
                  progressType: LinearProgressBar
                      .progressTypeLinear, // Use Linear progress
                  currentStep: 2,
                  progressColor: AppColors.primary,
                  backgroundColor: AppColors.linerProgressColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Image.asset(
                    AppAssets.liearProgressGift,
                    color: AppColors.primary,
                  ),
                )
              ],
            ),
          ),
          20.verticalSpace,
          Row(
            children: [
              Image.asset(AppAssets.gift2),
              5.horizontalSpace,
              Text(
                'لديك 4 مكافاة أخري لهذه المغسلة',
                style: semiBold(size: 12, color: AppColors.labelTextColor),
              )
            ],
          )
        ],
      ).paddingSymmetric(15, 20),
    );
  }
}
