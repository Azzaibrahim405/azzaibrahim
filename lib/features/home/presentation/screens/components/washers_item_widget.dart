import 'package:best_touch_training/core/locale/app_locale.dart';
import 'package:best_touch_training/core/routes/routes.dart';
import 'package:best_touch_training/core/shared_widgets/custom_elevated_button.dart';
import 'package:best_touch_training/core/utils/app_colors.dart';
import 'package:best_touch_training/core/utils/app_images.dart';
import 'package:best_touch_training/core/utils/app_strings.dart';
import 'package:best_touch_training/core/utils/app_text_style.dart';
import 'package:best_touch_training/core/utils/common_widgets.dart';
import 'package:best_touch_training/features/home/data/models/get_all_washers/get_all_washers_model/datum.dart';
import 'package:best_touch_training/features/home/data/models/get_all_washers/get_all_washers_model/washers_data_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WashersItemWidget extends StatelessWidget {
  const WashersItemWidget(this.washer, {super.key});
  final Datum washer;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CachedNetworkImage(
              imageUrl: washer.image ?? '',
              fit: BoxFit.cover,
              width: 50,
              height: 50,
            ),
            16.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  washer.name ?? "",
                  style: semiBold(size: 12, color: AppColors.labelTextColor),
                ),
                6.verticalSpace,
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: AppColors.rateColor,
                    ),
                    5.horizontalSpace,
                    Text(
                      washer.rate.toString(),
                      style: regularStyle(size: 12, color: AppColors.deepGrey),
                    )
                  ],
                ),
                10.verticalSpace,
                Row(
                  children: [
                    SvgPicture.asset(
                      AppAssets.location,
                      colorFilter: const ColorFilter.mode(
                          AppColors.primary, BlendMode.srcIn),
                    ),
                    5.horizontalSpace,
                    Text('${washer.distance}كيلو مترات بعيدا'),
                  ],
                )
              ],
            )
          ],
        ),
        CustomElevatedButton(
          width: 75.w,
          text: 'احجز',
          onPress: () {
            navigate(
                context: context,
                route: Routes.laundryProfile,
                args: washer.id);
          },
        )
      ],
    );
  }
}
