import 'package:best_touch_training/core/service_locator/service_locator.dart';
import 'package:best_touch_training/core/utils/app_colors.dart';
import 'package:best_touch_training/core/utils/app_images.dart';
import 'package:best_touch_training/core/utils/app_text_style.dart';
import 'package:best_touch_training/core/utils/extensions.dart';
import 'package:best_touch_training/features/laundry_profile/data/models/laundry_profile_model/laundry_details.dart';
import 'package:best_touch_training/features/laundry_profile/presentation/cubit/cubit/laundry_profile_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LaundryDetailsWidget extends StatelessWidget {
  const LaundryDetailsWidget({super.key, required this.laundryDetails});
  final LaundryDetails laundryDetails;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.greyLight,
                    ),
                    borderRadius: BorderRadius.circular(8)),
                child: CachedNetworkImage(
                    imageUrl: laundryDetails.image ?? '', width: 40)),
            6.horizontalSpace,
            Column(
              children: [
                Text(
                  laundryDetails.name ?? '',
                  style: boldStyle(color: AppColors.labelTextColor, size: 18),
                ),
                6.verticalSpace,
                Row(
                  children: [
                    SvgPicture.asset(
                      AppAssets.location,
                      colorFilter: const ColorFilter.mode(
                          AppColors.primary, BlendMode.srcIn),
                      width: 20,
                    ),
                    10.horizontalSpace,
                    Text(
                      '${laundryDetails.distance ?? 0} كيلومترات بعيدا',
                      style: regularStyle(size: 14, color: AppColors.greyColor),
                    ),
                  ],
                ),
                Text(
                  'اقرب الفروع الى موقعك الحالي',
                  style: regularStyle(size: 12, color: AppColors.greyColor),
                )
              ],
            ),
          ],
        ),
        Row(
          children: [
            const Icon(
              Icons.star,
              color: AppColors.rateColor,
            ),
            5.horizontalSpace,
            Text(
              laundryDetails.rate.toString(),
              style: regularStyle(size: 14, color: AppColors.deepGrey),
            )
          ],
        )
      ],
    );
  }
}
