import 'package:best_touch_training/core/utils/app_colors.dart';
import 'package:best_touch_training/core/utils/app_text_style.dart';
import 'package:best_touch_training/core/utils/extensions.dart';
import 'package:flutter/material.dart';

class CarDetailsCard extends StatelessWidget {
  const CarDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'سيارة صغيرة - غسلة عادية',
                style: semiBold(
                  size: 14,
                  color: AppColors.labelTextColor,
                ),
              ),
              Text(
                'عدد 2 كرسي',
                style: regularStyle(size: 12, color: AppColors.greyColor),
              ),
            ],
          ),
          Text(
            '300 ر.س',
            style: semiBold(size: 16, color: AppColors.deepGrey),
          )
        ],
      ).paddingSymmetric(16, 25),
    );
  }
}
