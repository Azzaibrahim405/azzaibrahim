import 'dart:developer';

import 'package:best_touch_training/core/shared_widgets/custom_elevated_button.dart';
import 'package:best_touch_training/core/utils/app_colors.dart';
import 'package:best_touch_training/core/utils/app_images.dart';
import 'package:best_touch_training/core/utils/app_text_style.dart';
import 'package:best_touch_training/core/utils/extensions.dart';
import 'package:best_touch_training/features/packages/data/models/public_packages_model/package_model.dart';
import 'package:best_touch_training/features/packages/presentation/screens/widgets/payment_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PackageItem extends StatelessWidget {
  final PackageModel packageModel;

  const PackageItem({
    super.key,
    required this.packageModel,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${packageModel.price} ر.س',
            style: semiBold(size: 14, color: AppColors.labelTextColor),
          ),
          5.verticalSpace,
          Text(
            'تحصل علي ${packageModel.balance} ر.س ',
            style: semiBold(size: 14, color: AppColors.greyColor),
          ),
          7.verticalSpace,
          CustomElevatedButton(
            onPress: () {
              log('azza');
              showModalBottomSheet(
                  clipBehavior: Clip.none,
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.zero,
                      topRight: Radius.zero,
                    ),
                  ),
                  builder: (context) {
                    return SizedBox(
                      height: 300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          20.verticalSpace,
                          Text(
                            'اختر طرق الدفع المناسبه',
                            style:
                                boldStyle(color: AppColors.primary, size: 16),
                          ),
                          PaymentCard(
                            onTap: () {},
                            paymentType: 'الدفع الالكتروني',
                            paymentImage: AppAssets.electronicPayment,
                          ),
                          10.verticalSpace,
                          PaymentCard(
                            onTap: () {},
                            paymentType: 'تمارا',
                            paymentImage: AppAssets.aboutApp,
                          ),
                        ],
                      ),
                    );
                  });
            },
            text: 'شراء',
          )
        ],
      ).paddingAll(10),
    );
  }
}
