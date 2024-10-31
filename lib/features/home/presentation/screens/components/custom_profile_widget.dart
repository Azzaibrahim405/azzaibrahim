import 'package:best_touch_training/core/locale/app_locale.dart';
import 'package:best_touch_training/core/routes/routes.dart';
import 'package:best_touch_training/core/service_locator/service_locator.dart';
import 'package:best_touch_training/core/utils/app_colors.dart';
import 'package:best_touch_training/core/utils/app_images.dart';
import 'package:best_touch_training/core/utils/app_strings.dart';
import 'package:best_touch_training/core/utils/app_text_style.dart';
import 'package:best_touch_training/core/utils/common_widgets.dart';
import 'package:best_touch_training/core/utils/extensions.dart';
import 'package:best_touch_training/features/auth/data/models/get_profile_model/get_profile_model/profile_data.dart';
import 'package:best_touch_training/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomProfileWidget extends StatelessWidget {
  CustomProfileWidget(this.userProfileData, {super.key});
  ProfileData userProfileData = ProfileData();

  @override
  Widget build(BuildContext context) {
    var cubit = sl<AuthCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            navigate(
              context: context, route: Routes.account,
              //args: userProfileData
            );

            //(userProfileData.avatar,userProfileData.name,userProfileData.location)
          },
          child: Row(
            children: [
              CircleAvatar(
                  child: CachedNetworkImage(
                imageUrl: cubit.userProfile?.avatar ?? '',
                fit: BoxFit.cover,
              )),
              8.horizontalSpace,
              Column(
                children: [
                  Text(
                    AppStrings.welcomeback.tr(context),
                    style: regularStyle(size: 12, color: AppColors.greyColor),
                  ),
                  Text(
                    cubit.userProfile?.name ?? '',
                    style: regularStyle(size: 14, color: AppColors.deepGrey),
                  )
                ],
              )
            ],
          ),
        ),
        InkWell(
          onTap: () {
            navigate(context: context, route: Routes.notifications);
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.borderColor),
              borderRadius: BorderRadius.circular(5),
            ),
            child: SvgPicture.asset(AppAssets.notification).paddingAll(4),
          ),
        )
      ],
    );
  }
}
