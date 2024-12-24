import 'package:best_touch_training/core/shared_widgets/custom_elevated_button.dart';
import 'package:best_touch_training/core/utils/app_colors.dart';
import 'package:best_touch_training/core/utils/app_text_style.dart';
import 'package:best_touch_training/core/utils/extensions.dart';
import 'package:best_touch_training/features/reservation/data/models/reservation_model/order_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderItemWidget extends StatelessWidget {
  const OrderItemWidget({super.key, required this.orderItem});
  final OrderItem orderItem;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.onPrimary,
      elevation: 10,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CachedNetworkImage(
                imageUrl: orderItem.size?.image ?? '',
                width: 50,
              ), // Image.asset(
              //   AppAssets.car,
              //   width: 70,
              // ),
              10.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${orderItem.size?.name} - ${orderItem.service?.name}',
                      style: boldStyle(color: AppColors.deepGrey, size: 14),
                    ),
                    2.verticalSpace,
                    Text(
                      '${orderItem.washer?.name}',
                      style: regularStyle(
                          size: 12, color: AppColors.labelTextColor),
                    )
                  ],
                ),
              ),
              10.horizontalSpace,
              Column(
                children: [
                  Text(
                    'الإجمالي:',
                    style: semiBold(size: 12, color: AppColors.greyColor),
                  ),
                  Text(
                    '${orderItem.total}',
                    style: semiBold(size: 16, color: AppColors.labelTextColor),
                  )
                ],
              )
            ],
          ),
          20.verticalSpace,
          CustomElevatedButton(
            textColor: AppColors.primary,
            borderColor: AppColors.primary,
            color: Colors.white,
            onPress: () {},
            text: 'أظهر الكود الى العامل',
          )
        ],
      ).paddingAll(20),
    );
  }
}
