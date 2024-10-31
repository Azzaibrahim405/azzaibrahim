import 'package:best_touch_training/core/utils/app_colors.dart';
import 'package:best_touch_training/core/utils/app_images.dart';
import 'package:best_touch_training/core/utils/app_text_style.dart';
import 'package:best_touch_training/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SimpleAppBar extends AppBar {
  SimpleAppBar({
    super.key,
    String? title,
    List<Widget>? actions,
    bool leading = true,
    required BuildContext context,
  }) : super(
          backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          elevation: 0.0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          leading: leading
              ? InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.r),
                      border: Border.all(color: AppColors.borderColor),
                    ),
                    // child: Image.asset(AppAssets.appbarArrow).paddingAll(7),
                    child: SvgPicture.asset(AppAssets.appbarArrow),
                  ).paddingOnly(right: 20, top: 20),
                )
              : const SizedBox(),
          actions: actions ?? [const SizedBox()],
          title: Text(
            title ?? '',
            style: semiBold(size: 20, color: AppColors.labelTextColor),
          ),
        );
}
