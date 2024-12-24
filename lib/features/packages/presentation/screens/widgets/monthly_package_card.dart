import 'package:best_touch_training/core/routes/routes.dart';
import 'package:best_touch_training/core/utils/app_colors.dart';
import 'package:best_touch_training/core/utils/app_text_style.dart';
import 'package:best_touch_training/core/utils/common_widgets.dart';
import 'package:best_touch_training/core/utils/extensions.dart';
import 'package:best_touch_training/features/packages/data/models/get_monthly_package_model/monthly_package.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class MonthlyPackageCard extends StatelessWidget {
  const MonthlyPackageCard({super.key, required this.monthlyPackage});
  final MonthlyPackage monthlyPackage;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigate(context: context, route: Routes.dataForm);
      },
      child: Card(
        margin: EdgeInsets.all(10),
        elevation: 10,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        CachedNetworkImage(
                          imageUrl: monthlyPackage.size?.image ?? '',
                          fit: BoxFit.contain,
                          width: 50,
                          height: 50,
                        ),
                        10.horizontalSpace,
                        Column(
                          children: [
                            Text(
                              '${monthlyPackage.name}',
                              style:
                                  semiBold(size: 14, color: AppColors.primary),
                            ),
                            Text(' حجم السيارة: ${monthlyPackage.size?.name} '),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [Text('${monthlyPackage.price} '), Text('ر.س')],
                )
              ],
            ).paddingSymmetric(10, 5),
            Row(
              children: [
                20.horizontalSpace,
                const Icon(
                  Icons.check,
                  color: AppColors.primary,
                ),
                10.horizontalSpace,
                HtmlWidget(monthlyPackage.description ?? '')
              ],
            ),
            10.verticalSpace
          ],
        ),
      ),
    );
  }
}
