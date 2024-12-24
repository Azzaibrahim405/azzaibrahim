import 'package:best_touch_training/core/shared_widgets/custom_loading_indicator.dart';
import 'package:best_touch_training/core/shared_widgets/simple_appbar.dart';
import 'package:best_touch_training/core/utils/app_colors.dart';
import 'package:best_touch_training/core/utils/common_widgets.dart';
import 'package:best_touch_training/core/utils/enums.dart';
import 'package:best_touch_training/core/utils/extensions.dart';
import 'package:best_touch_training/features/reservation/presentation/cubit/reservation_cubit/reservation_cubit.dart';
import 'package:best_touch_training/features/reservation/presentation/screens/components/order_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({super.key});

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen>
    with TickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    // tabController.addListener(() {
    //   setState(() {}); // تحديث الواجهة عند تغيير الـTab
    // });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReservationCubit, ReservationState>(
      listener: (context, state) {
        if (state is ReservationSuccess) {
          showToast(msg: 'تم تحميل اللسته بنجاح', state: ToastStates.success);
        } else if (state is ReservationError) {
          showToast(msg: 'حدث خطأ ف تحميل اللسته', state: ToastStates.success);
        }
      },
      builder: (context, state) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
              appBar: SimpleAppBar(
                leading: false,
                context: context,
                title: 'الحجوزات',
                bottom: TabBar(
                  onTap: (value) {
                    if (value == 0) {
                      context.read<ReservationCubit>().getAllReservations(
                            OrderStatus.pending,
                            // OrderStatus.inProgress
                          );
                    } else {
                      context.read<ReservationCubit>().getAllReservations(
                            OrderStatus.completed,
                          );
                    }
                  },
                  indicatorColor: Colors.transparent,
                  unselectedLabelColor: AppColors.greyColor,
                  dividerColor: Colors.transparent,
                  labelColor: Colors.white,
                  controller: tabController,
                  tabs: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: tabController.index == 0
                            ? AppColors.primary
                            : AppColors.greyLight,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text(
                        ' الحاليه ',
                      ).paddingSymmetric(35, 7),
                    ),
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: tabController.index == 1
                            ? AppColors.primary // لون أخضر عند التحديد
                            : AppColors.greyLight, // لون رمادي عند عدم التحديد
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text('السابقه').paddingSymmetric(35, 7),
                    ),
                  ],
                ),
              ),
              body: TabBarView(controller: tabController, children: <Widget>[
                state is ReservationSuccess
                    ? ListView.separated(
                        itemBuilder: (context, index) {
                          return OrderItemWidget(
                            orderItem: state.orders[index],
                          );
                        },
                        separatorBuilder: (context, index) => 16.verticalSpace,
                        itemCount: state.orders.length)
                    : const CustomLoadingIndicator(),
                state is ReservationSuccess
                    ? ListView.separated(
                        itemBuilder: (context, index) {
                          return OrderItemWidget(
                            orderItem: state.orders[index],
                          );
                        },
                        separatorBuilder: (context, index) => 16.verticalSpace,
                        itemCount: state.orders.length)
                    : const CustomLoadingIndicator()
              ]).paddingAll(20)),
        );
      },
    );
  }
}
