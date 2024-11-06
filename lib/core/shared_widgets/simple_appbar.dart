import 'package:best_touch_training/core/routes/routes.dart';
import 'package:best_touch_training/core/utils/app_colors.dart';
import 'package:best_touch_training/core/utils/app_images.dart';
import 'package:best_touch_training/core/utils/app_text_style.dart';
import 'package:best_touch_training/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SimpleAppBar extends PreferredSize {
  final bool leading;
  final BuildContext context;
  final List<Widget>? actions;
  final String? title;
  final PreferredSizeWidget? bottom;
  SimpleAppBar(
      {super.key,
      this.leading = true,
      required this.context,
      this.actions,
      this.title,
      this.bottom})
      : super(
            preferredSize: const Size.fromHeight(100),
            child: AppBar(
              bottom: bottom,
              leading: leading
                  ? InkWell(
                      onTap: () {
                        if (Navigator.canPop(context)) {
                          Navigator.pop(context);
                        } 
                                    print('No previous route');

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
            ));
}
