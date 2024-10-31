import 'package:best_touch_training/core/locale/app_locale.dart';
import 'package:best_touch_training/core/shared_widgets/custom_text_button.dart';
import 'package:best_touch_training/core/utils/app_colors.dart';
import 'package:best_touch_training/core/utils/app_images.dart';
import 'package:best_touch_training/core/utils/app_strings.dart';
import 'package:best_touch_training/core/utils/extensions.dart';
import 'package:best_touch_training/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ActionsWidget extends StatelessWidget {
  const ActionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomTextButton(
          onPress: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
                (Route<dynamic> route) => false);
          },
          text: AppStrings.guest.tr(context),
          textColor: AppColors.greyColor,
        ),
        SvgPicture.asset(AppAssets.arrowLeft).paddingLeft(
          15,
        )
      ],
    );
  }
}
