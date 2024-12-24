import 'package:best_touch_training/core/utils/app_colors.dart';
import 'package:best_touch_training/core/utils/app_text_style.dart';
import 'package:best_touch_training/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard(
      {super.key,
      required this.paymentType,
      required this.paymentImage,
      this.onTap});
  final String paymentType;
  final String paymentImage;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        elevation: 10,
        child: Row(
          children: [
            SvgPicture.asset(paymentImage),
            10.horizontalSpace,
            Text(
              paymentType,
              style: semiBold(size: 14, color: AppColors.labelTextColor),
            )
          ],
        ).paddingAll(10),
      ),
    );
  }
}
