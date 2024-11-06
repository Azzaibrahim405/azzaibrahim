import 'dart:developer';
import 'package:best_touch_training/core/routes/routes.dart';
import 'package:best_touch_training/core/service_locator/service_locator.dart';
import 'package:best_touch_training/core/shared_widgets/custom_elevated_button.dart';
import 'package:best_touch_training/core/shared_widgets/custom_loading_indicator.dart';
import 'package:best_touch_training/core/shared_widgets/simple_appbar.dart';
import 'package:best_touch_training/core/utils/app_colors.dart';
import 'package:best_touch_training/core/utils/app_text_style.dart';
import 'package:best_touch_training/core/utils/common_widgets.dart';
import 'package:best_touch_training/core/utils/extensions.dart';
import 'package:best_touch_training/features/services/presentation/cubit/additions_service_cubit/cubit/addition_services_cubit.dart';
import 'package:best_touch_training/features/services/presentation/screens/widgets/additions_item.dart';
import 'package:best_touch_training/features/services/presentation/screens/widgets/custom_row.dart';
import 'package:best_touch_training/features/services/presentation/screens/widgets/service_item.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdditionsServicesScreen extends StatefulWidget {
  const AdditionsServicesScreen({
    super.key,
    required this.contentParams,
  });
  final ContentParams contentParams;

  @override
  State<AdditionsServicesScreen> createState() =>
      _AdditionsServicesScreenState();
}

class _AdditionsServicesScreenState extends State<AdditionsServicesScreen> {
  var list = sl<AdditionServicesCubit>().additionsList;
  var cubit = sl<AdditionServicesCubit>();

  @override
  void initState() {
    sl<AdditionServicesCubit>().getAdditionsServices(
      serviceId: widget.contentParams.serviceId ?? 0,
      washerId: widget.contentParams.washerId ?? 0,
      sizeId: widget.contentParams.sizeId ?? 0,
    );
    cubit.selectedIndex = [];
    cubit.totalPrice = 0.0;
    cubit.additionPrice = 0.0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log('******${list.toString()} ****');
    log('name is   ${widget.contentParams.name} ');
    log('description is  ${widget.contentParams.description} ');
    log('washer id is  ${widget.contentParams.washerId} ');
    log('service id is  ${widget.contentParams.serviceId} ');
    log('size id is  ${widget.contentParams.sizeId} ');

    return BlocConsumer<AdditionServicesCubit, AdditionServicesState>(
      listener: (context, state) {
        if (state is AdditionServicesError) {
          showToast(msg: state.message, state: ToastStates.error);
        } else if (state is AdditionServicesSuccess) {
          showToast(msg: "succes ", state: ToastStates.success);
          list = state.additions;
        }
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: SimpleAppBar(
              context: context,
              leading: true,
              title: widget.contentParams.name,
            ),
            body: ListView(
              children: [
                16.verticalSpace,
                Text(
                  'الخدمات المقدمة',
                  style: semiBold(size: 16, color: AppColors.labelTextColor),
                ),
                Html(
                  data: widget.contentParams.description ?? '',
                ),
                24.verticalSpace,
                Text(
                  list.isEmpty ? "" : 'الخدمات الاضافيه',
                  style: semiBold(size: 16, color: AppColors.labelTextColor),
                ),
                state is AdditionServicesLoading
                    ? const CustomLoadingIndicator()
                    : SizedBox(
                        height: 300,
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            return AdditionsItem(
                                additionModel: list[index],
                                value: cubit.selectedIndex.contains(index),
                                onChanged: (bool? val) => cubit.toggleCheckBox(
                                      isSelected: val! ? true : false,
                                      price: widget.contentParams.price!
                                          .toDouble(),
                                      index: index,
                                      servicePrice:
                                          list[index].price!.toDouble(),
                                    ));
                                    
                          },
                          separatorBuilder: (context, index) =>
                              16.verticalSpace,
                          itemCount: list.length,
                        ),
                      ),
              ],
            ).paddingAll(16),
            bottomNavigationBar: Container(
              color: AppColors.greyLight,
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                CustomRowWidget(
                  text1: 'السعر',
                  text2: '${widget.contentParams.price} ر.س',
                ),
                Visibility(
                  visible: cubit.additionPrice > 0,
                  //cubit.priceAddition > 0.0,
                  child: CustomRowWidget(
                      text1: 'الاضافي', text2: "${cubit.additionPrice}"
                      //  cubit.priceAddition != 0.0
                      //     ? cubit.priceAddition.toString()
                      //     : '',
                      ),
                ),
                Visibility(
                  visible: (cubit.totalPrice > 0 && cubit.additionPrice > 0),
                  child: DottedLine(
                    dashColor: AppColors.dashLineColor,
                  ),
                ),
                Visibility(
                  visible: cubit.totalPrice > 0,
                  //  cubit.totalPrice > 0.0 &&
                  //     cubit.totalPrice !=
                  //         widget.contentParams.price?.toDouble(),
                  child: CustomRowWidget(
                    text1: 'الاجمالي',
                    text2: '${cubit.totalPrice}',
                    // cubit.totalPrice != 0.0
                    //     ? cubit.totalPrice.toString()
                    //     : '',
                    totalColor: AppColors.labelTextColor,
                    valueColor: AppColors.primary,
                  ),
                ),
                CustomElevatedButton(
                  text: 'احجز',
                  onPress: () {
                    cubit.additionsList = list;
                    cubit.contentParams = widget.contentParams;
                    Navigator.pushNamed(
                      context,
                      Routes.reservationConfirmationScreen,
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
