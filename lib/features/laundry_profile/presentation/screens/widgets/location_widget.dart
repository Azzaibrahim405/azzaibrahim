import 'package:best_touch_training/core/utils/app_colors.dart';
import 'package:best_touch_training/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -30,
      left: 30,
      child: InkWell(
        onTap: () {},
        child: Positioned(
          top: -30,
          left: 30,
          child: CircleAvatar(
            radius: 25,
            backgroundColor: AppColors.primary,
            child: Image.asset(AppAssets.map),
          ),
        ),
      ),
    );
  }
}
