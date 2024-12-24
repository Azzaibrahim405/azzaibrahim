import 'dart:developer';

import 'package:best_touch_training/core/shared_widgets/custom_elevated_button.dart';
import 'package:best_touch_training/core/utils/app_colors.dart';
import 'package:best_touch_training/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCardWidget extends StatelessWidget {
  final int price;
  final int balance;
  const CustomCardWidget({
    super.key,
    required this.price,
    required this.balance,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 10,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$price ر.س',
              style: semiBold(size: 14, color: AppColors.labelTextColor),
            ),
            5.verticalSpace,
            Text(
              '$balance ر.س مجانا',
              style: semiBold(size: 14, color: AppColors.greyColor),
            ),
            7.verticalSpace,
            CustomElevatedButton(
              onPress: () {
                print('dfghngfvds');
                // showModalBottomSheet(
                //     isScrollControlled: true,
                //     context: context,
                //     builder: (context) {
                //       return Container(
                //         color: Colors.amber,
                //         height: 300,
                //       );
                //     });
              },
              text: 'شراء',
            )
          ],
        ));
  }
}
