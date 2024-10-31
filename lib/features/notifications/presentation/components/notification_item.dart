import 'package:best_touch_training/core/utils/app_colors.dart';
import 'package:best_touch_training/core/utils/app_images.dart';
import 'package:best_touch_training/core/utils/app_text_style.dart';
import 'package:best_touch_training/core/utils/extensions.dart';
import 'package:best_touch_training/features/notifications/data/models/get_all_notifications_model/notification_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NotificationsItem extends StatelessWidget {
  const NotificationsItem({super.key, required this.notificationItemModel});
  final NotificationItemModel notificationItemModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.greyLight),
              borderRadius: BorderRadius.circular(4),
              shape: BoxShape.rectangle),
          child: Image.asset(
            AppAssets.notificationItem,
            width: 20,
            height: 20,
          ).paddingAll(10),
        ),
        8.horizontalSpace,
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              notificationItemModel.title ?? '',
              style: semiBold(size: 14, color: AppColors.labelTextColor),
            ),
            5.verticalSpace,
            Text(
              notificationItemModel.message ?? '',
              style: regularStyle(size: 12, color: AppColors.deepGrey),
            ),
            8.verticalSpace,
            Row(
              children: [
                SvgPicture.asset(
                  AppAssets.reservation,
                  width: 20,
                ),
                8.horizontalSpace,
                Text(
                  notificationItemModel.createdAtFormatted ?? '',
                  style: regularStyle(size: 12, color: AppColors.greyColor),
                )
              ],
            )
          ],
        ),
      ],
    ).paddingVertical(16);
  }
}
