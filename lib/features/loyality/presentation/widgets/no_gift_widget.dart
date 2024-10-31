import 'package:best_touch_training/core/routes/routes.dart';
import 'package:best_touch_training/core/shared_widgets/custom_elevated_button.dart';
import 'package:best_touch_training/core/utils/app_colors.dart';
import 'package:best_touch_training/core/utils/app_images.dart';
import 'package:best_touch_training/core/utils/app_text_style.dart';
import 'package:best_touch_training/core/utils/common_widgets.dart';
import 'package:best_touch_training/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoGiftWidget extends StatelessWidget {
  const NoGiftWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          150.verticalSpace,
          Image.asset(
            AppAssets.noGift,
            color: AppColors.greyColor,
          ),
          10.verticalSpace,
          Text(
            'لايوجد نقاط ولاء',
            style: semiBold(size: 16, color: AppColors.greyColor),
          ),
          16.verticalSpace,
          CustomElevatedButton(
            onPress: () {
              navigate(context: context, route: Routes.home);
            },
            text: 'طلب غسله',
          ).paddingHorizontal(40)
        ],
      ),
    );
  }
}
