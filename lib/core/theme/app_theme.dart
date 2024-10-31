import 'package:best_touch_training/core/utils/app_colors.dart';
import 'package:best_touch_training/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.onPrimary,
    appBarTheme: const AppBarTheme(centerTitle: true),
    //button style
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.r)))),
    //textfield style
    inputDecorationTheme: InputDecorationTheme(
        enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(4.r)),
        fillColor: AppColors.onPrimary,
        filled: true,
        hintStyle: regularStyle(size: 12.sp, color: AppColors.hintColor)),
    // bottom navigation bar

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedLabelStyle: semiBold(size: 12, color: AppColors.primary),
      unselectedLabelStyle: semiBold(
        size: 12,
        color: AppColors.greyColor,
      ),
      selectedIconTheme: IconThemeData(
        color: AppColors.primary,
        size: 24.sp,
      ),
      unselectedIconTheme: IconThemeData(
        color: AppColors.greyColor,
        size: 24.sp,
      ),
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.greyColor,
    ),
  );
}
