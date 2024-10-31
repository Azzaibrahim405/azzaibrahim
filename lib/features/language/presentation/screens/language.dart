import 'package:best_touch_training/core/bloc/cubit/global_cubit.dart';
import 'package:best_touch_training/core/locale/app_locale.dart';
import 'package:best_touch_training/core/utils/app_colors.dart';
import 'package:best_touch_training/core/utils/app_images.dart';
import 'package:best_touch_training/core/utils/app_strings.dart';
import 'package:best_touch_training/core/utils/app_text_style.dart';
import 'package:best_touch_training/features/language/presentation/screens/components/language_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<GlobalCubit, GlobalState>(
          builder: (context, state) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(AppAssets.smallLogo),
                Text(
                  AppStrings.welcome.tr(context),
                  style: semiBold(size: 20, color: AppColors.primary),
                ),
                2.verticalSpace,
                SizedBox(
                  width: double.infinity,
                  child: LanguageContainerWidget(
                    isEnglish: true,
                    text: 'English',
                    onTap: () {
                      BlocProvider.of<GlobalCubit>(context).changeLanguage();
                    },
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: LanguageContainerWidget(
                    isEnglish: true,
                    onTap: () {
                      BlocProvider.of<GlobalCubit>(context).changeLanguage();
                    },
                    text: 'العربيه',
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
