import 'package:best_touch_training/core/service_locator/service_locator.dart';
import 'package:best_touch_training/core/shared_widgets/custom_loading_indicator.dart';
import 'package:best_touch_training/core/shared_widgets/simple_appbar.dart';
import 'package:best_touch_training/core/utils/app_colors.dart';

import 'package:best_touch_training/core/utils/app_text_style.dart';
import 'package:best_touch_training/core/utils/common_widgets.dart';
import 'package:best_touch_training/core/utils/extensions.dart';
import 'package:best_touch_training/features/notifications/presentation/components/notification_item.dart';
import 'package:best_touch_training/features/notifications/presentation/cubit/notifications_cubit.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  void initState() {
    sl<NotificationsCubit>().getAllNotifications();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(
        context: context,
        title: 'الاشعارات',
        leading: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'اليوم',
                style: boldStyle(color: AppColors.labelTextColor, size: 14),
              ),
            ),
            BlocBuilder<NotificationsCubit, NotificationsState>(
              builder: (context, state) {
                if (state is NotificationsLoadingState) {
                  return const CustomLoadingIndicator();
                } else if (state is NotificationsErrorState) {
                  showToast(msg: state.message, state: ToastStates.error);
                } else if (state is NotificationsSuccessState) {
                  return Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return NotificationsItem(
                          notificationItemModel: state.notificationsList[index],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const DottedLine(
                          dashLength: 4,
                          dashGapLength: 5,
                          dashColor: AppColors.dashLineColor,
                        );
                      },
                      itemCount: state.notificationsList.length,
                    ),
                  );
                }
                return Center(
                    child: Text(
                  ' خطأ في تحميل اللسته يرجي تسجيل الدخول',
                  style: boldStyle(color: AppColors.primary, size: 22),
                ));
              },
            )
          ],
        ).paddingAll(16),
      ),
    );
  }
}
