import 'package:best_touch_training/core/shared_widgets/simple_appbar.dart';

import 'package:best_touch_training/core/utils/extensions.dart';
import 'package:best_touch_training/features/loyality/presentation/widgets/free_loyality_widget.dart';
import 'package:best_touch_training/features/loyality/presentation/widgets/loyality_item.dart';
import 'package:best_touch_training/features/loyality/presentation/widgets/no_gift_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoyalityScreen extends StatelessWidget {
  const LoyalityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(
        context: context,
        title: 'نقاط الولاء',
        leading: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FreeLoyalityWidget(),
          24.verticalSpace,
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return const LoyalityItem();
                },
                separatorBuilder: (context, index) => 16.verticalSpace,
                itemCount: 10),
          )
        ],
      ).paddingSymmetric(10, 20),
    );
  }
}
