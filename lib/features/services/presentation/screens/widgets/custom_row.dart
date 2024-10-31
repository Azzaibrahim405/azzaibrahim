import 'package:best_touch_training/core/utils/app_colors.dart';
import 'package:best_touch_training/core/utils/app_text_style.dart';
import 'package:best_touch_training/core/utils/extensions.dart';
import 'package:best_touch_training/features/services/data/models/additions_model/addtions_services_model/addition_model.dart';
import 'package:flutter/material.dart';

class CustomRowWidget extends StatelessWidget {
  final Color? totalColor;
  final Color? valueColor;
  final String? text1;
  final String? text2;

  final AdditionModel? additionModel;
  const CustomRowWidget(
      {super.key,
      this.valueColor,
      this.totalColor,
      this.additionModel,
      this.text1,
      this.text2});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1 ?? '',
          style:
              regularStyle(size: 12, color: totalColor ?? AppColors.greyColor),
        ),
        Text(
          text2 ?? '',
          style: semiBold(size: 16, color: valueColor ?? AppColors.deepGrey),
        ),
      ],
    ).paddingVertical(2);
  }
}
