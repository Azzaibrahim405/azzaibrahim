import 'package:best_touch_training/core/routes/routes.dart';
import 'package:best_touch_training/core/shared_widgets/custom_elevated_button.dart';
import 'package:best_touch_training/core/utils/app_colors.dart';
import 'package:best_touch_training/core/utils/app_images.dart';
import 'package:best_touch_training/core/utils/app_text_style.dart';
import 'package:best_touch_training/core/utils/common_widgets.dart';
import 'package:best_touch_training/core/utils/extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProfileAccountCardWidget extends StatelessWidget {
  const ProfileAccountCardWidget({super.key, required this.name});
  //final ProfileData userProfile;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: CachedNetworkImage(imageUrl: AppAssets.person),
              ),
              5.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: semiBold(size: 14, color: AppColors.labelTextColor),
                  ),
                  5.verticalSpace,
                  Row(
                    children: [
                      SvgPicture.asset(AppAssets.location),
                      const Text('السعوديه'),
                    ],
                  )
                ],
              ),
            ],
          ),
          CustomElevatedButton(
            width: 80.w,
            height: 35,
            onPress: () {
              navigate(context: context, route: Routes.editProfile);
            },
            text: 'تعديل',
          )
        ],
      ).paddingAll(10),
    );
  }
}
