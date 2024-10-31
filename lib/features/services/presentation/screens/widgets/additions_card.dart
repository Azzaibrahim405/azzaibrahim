import 'package:best_touch_training/core/utils/app_colors.dart';
import 'package:best_touch_training/features/services/presentation/screens/widgets/custom_row.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class AdditionsCardWidget extends StatelessWidget {
  const AdditionsCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomRowWidget(
          text2: '30 ر.س',
          text1: 'الخدمات الاضافيه',
        ),
        DottedLine(
          dashColor: AppColors.dashLineColor,
        ),
        CustomRowWidget(
          text1: 'الاجمالي',
          text2: '30 ر.س',
          totalColor: AppColors.labelTextColor,
          valueColor: AppColors.primary,
        )
      ],
    );
  }
}
