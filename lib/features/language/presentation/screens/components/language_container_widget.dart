import 'package:best_touch_training/core/utils/app_colors.dart';
import 'package:best_touch_training/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class LanguageContainerWidget extends StatelessWidget {
  final Function()? onTap;
  final String? text;
  bool isSelected;
  bool? isEnglish;
  LanguageContainerWidget({
    super.key,
    this.onTap,
    this.text,
    this.isEnglish,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    int index = 0;

    return InkWell(
        onTap: onTap
        // setState(() {
        //        widget.isSelected = !widget.isSelected;
        // });

        ,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          decoration: BoxDecoration(
              border: Border.all(
                  color: isSelected == index
                      ? AppColors.primary
                      : AppColors.hintColor)),
          child: isSelected == index
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      text ?? '',
                      style: regularStyle(
                          size: 16, color: AppColors.labelTextColor),
                    ),
                    const Icon(
                      Icons.check,
                      color: AppColors.labelTextColor,
                    )
                  ],
                )
              : isEnglish == true
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Spacer(),
                        Text(
                          text ?? '',
                          style: regularStyle(
                              size: 16, color: AppColors.labelTextColor),
                        ),
                      ],
                    )
                  : Text(
                      text ?? '',
                      style: regularStyle(
                          size: 16, color: AppColors.labelTextColor),
                    ),
        ));
  }
}
