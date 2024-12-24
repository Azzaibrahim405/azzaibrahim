import 'package:best_touch_training/core/routes/routes.dart';
import 'package:best_touch_training/core/shared_widgets/custom_elevated_button.dart';
import 'package:best_touch_training/core/shared_widgets/custom_loading_indicator.dart';
import 'package:best_touch_training/core/shared_widgets/simple_appbar.dart';
import 'package:best_touch_training/core/utils/app_colors.dart';
import 'package:best_touch_training/core/utils/app_text_style.dart';
import 'package:best_touch_training/core/utils/common_widgets.dart';
import 'package:best_touch_training/core/utils/extensions.dart';
import 'package:best_touch_training/features/services/data/models/addition_quantity_model.dart';
import 'package:best_touch_training/features/services/data/models/order_request_body.dart';
import 'package:best_touch_training/features/services/presentation/cubit/additions_service/cubit/addition_services_cubit.dart';
import 'package:best_touch_training/features/services/presentation/screens/widgets/additions_item.dart';
import 'package:best_touch_training/features/services/presentation/screens/widgets/custom_row.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReservationConfirmationScreen extends StatelessWidget {
  const ReservationConfirmationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AdditionServicesCubit>();
    return BlocConsumer<AdditionServicesCubit, AdditionServicesState>(
      listener: (context, state) {
        if (state is OrdersConfirmationError) {
          showToast(msg: state.message, state: ToastStates.error);
        } else if (state is OrdersConfirmationSuccess) {
          showToast(msg: 'تم تأكيد الاوردر بنجاح', state: ToastStates.success);
          navigate(context: context, route: Routes.reservation);
        }
      },
      builder: (context, state) {
        return Scaffold(
            appBar: SimpleAppBar(
              context: context,
              title: 'تأكيد الحجز',
            ),
            body: ListView(
              children: [
                Card(
                  color: Colors.white,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${cubit.contentParams?.sizeName ?? ''} - ${cubit.contentParams?.name}',
                            style: semiBold(
                              size: 14,
                              color: AppColors.labelTextColor,
                            ),
                          ),
                          Text(
                            'عدد 2 كرسي',
                            style: regularStyle(
                                size: 12, color: AppColors.greyColor),
                          ),
                        ],
                      ),
                      Text(
                        '${cubit.contentParams?.price} ر.س',
                        style: semiBold(size: 16, color: AppColors.deepGrey),
                      )
                    ],
                  ).paddingSymmetric(16, 25),
                ),
                20.verticalSpace,
                Text(
                  'الخدمات المقدمه',
                  style: semiBold(size: 16, color: AppColors.labelTextColor),
                ),
                16.verticalSpace,
                Html(
                  data: cubit.contentParams?.description ?? '',
                ),
                20.verticalSpace,
                Text(
                  'الخدمات الاضافيه',
                  style: semiBold(size: 16, color: AppColors.labelTextColor),
                ),
                16.verticalSpace,
                SizedBox(
                  height: 300,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => 16.verticalSpace,
                    itemCount: cubit.checkList.length,
                    itemBuilder: (context, index) {
                      return AdditionsItem(
                        additionModel: cubit.checkList[index],
                        value: true,
                      );
                    },
                  ),
                )
              ],
            ).paddingHorizontal(16),
            bottomNavigationBar: Container(
              color: AppColors.greyLight,
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                CustomRowWidget(
                  text1: 'السعر',
                  text2: '${cubit.contentParams!.price} ر.س',
                ),
                Visibility(
                  visible: cubit.additionPrice > 0,
                  //cubit.priceAddition > 0.0,
                  child: CustomRowWidget(
                      text1: 'الاضافي', text2: "${cubit.additionPrice}"),
                ),
                Visibility(
                  visible: (cubit.totalPrice > 0 && cubit.additionPrice > 0),
                  child: const DottedLine(
                    dashColor: AppColors.dashLineColor,
                  ),
                ),
                Visibility(
                  visible: cubit.totalPrice > 0,
                  child: CustomRowWidget(
                    text1: 'الاجمالي',
                    text2: '${cubit.totalPrice}',
                    totalColor: AppColors.labelTextColor,
                    valueColor: AppColors.primary,
                  ),
                ),
                state is OrdersConfirmationLoading
                    ? const CustomLoadingIndicator()
                    : CustomElevatedButton(
                        text: 'تأكيد الحجز',
                        onPress: () {
                          context
                              .read<AdditionServicesCubit>()
                              .confirmationOrder(
                                orderBody: OrderBody(
                                  sizeId: cubit.contentParams?.sizeId,
                                  washerId: cubit.contentParams?.washerId,
                                  additions: cubit.checkList.map((e) {
                                    return AdditionQuantityModel(
                                        additionId: e.id ?? 0, quantity: 1);
                                  }).toList(),
                                  serviceId: cubit.contentParams?.serviceId,
                                ),
                              );
                        },
                      ),
                5.verticalSpace
              ]).paddingHorizontal(15),
            ));
      },
    );
  }
}
