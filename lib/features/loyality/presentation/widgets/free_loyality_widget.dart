import 'package:best_touch_training/core/utils/app_colors.dart';
import 'package:best_touch_training/core/utils/app_images.dart';
import 'package:best_touch_training/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FreeLoyalityWidget extends StatelessWidget {
  const FreeLoyalityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          AppAssets.loyalityIcon,
          width: 30,
          height: 30,
        ),
        7.horizontalSpace,
        Expanded(
          child: Text(
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            'أكمل 4 غسلات من نفس النوع الغسلة وأحصل على الخامسة مجانًا',
            style: regularStyle(size: 14, color: AppColors.greyColor),
          ),
        )
      ],
    );
  }
}
