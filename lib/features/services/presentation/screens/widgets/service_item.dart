import 'dart:developer';
import 'package:best_touch_training/core/routes/routes.dart';
import 'package:best_touch_training/core/shared_widgets/custom_text_button.dart';
import 'package:best_touch_training/core/utils/app_colors.dart';
import 'package:best_touch_training/core/utils/app_text_style.dart';
import 'package:best_touch_training/core/utils/common_widgets.dart';
import 'package:best_touch_training/core/utils/extensions.dart';
import 'package:best_touch_training/features/laundry_profile/presentation/cubit/cubit/laundry_profile_cubit.dart';
import 'package:best_touch_training/features/laundry_profile/presentation/screens/widgets/cars_type_widget.dart';
import 'package:best_touch_training/features/services/data/models/get_service_model/service_item.dart';
import 'package:best_touch_training/features/services/presentation/cubit/additions_service/cubit/addition_services_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceItem extends StatelessWidget {
  const ServiceItem(
      {super.key, required this.serviceItemModel, this.serviceParams});
  final ServiceItemModel serviceItemModel;
  final ServiceParams? serviceParams;

  @override
  Widget build(BuildContext context) {
    var landryDetails =
        context.read<LaundryProfileCubit>().laundryProfileDetails;
    log(" price of service is ##### ${serviceItemModel.price ?? 10}");
    return Card(
      elevation: 3,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                serviceItemModel.name ?? '',
                style: semiBold(size: 16, color: AppColors.labelTextColor),
              ),
              4.verticalSpace,
              CustomTextButton(
                isUnderline: true,
                onPress: () {
                  context.read<AdditionServicesCubit>().checkList = [];
                  navigate(
                      context: context,
                      route: Routes.additionsServices,
                      args: ContentParams(
                          washerId: landryDetails?.id,
                          sizeName: serviceParams?.name,
                          washerName: landryDetails?.name ?? '',
                          sizeId: serviceParams?.sizeId,
                          serviceId: serviceItemModel.id,
                          description: serviceItemModel.description,
                          name: serviceItemModel.name,
                          price: serviceItemModel.price ?? 0));
                },
                text: 'ما تحتويه؟',
                textColor: AppColors.greyColor,
              )
            ],
          ),
          Text(
            '${serviceItemModel.price} ر.س ',
            style: semiBold(size: 16, color: AppColors.deepGrey),
          )
        ],
      ).paddingAll(10),
    );
  }
}

class ContentParams {
  final int? washerId;
  final String? washerName;
  final int? sizeId;
  final int? serviceId;
  final String? description;
  final String? name;
  final int? price;
  final String? sizeName;

  ContentParams(
      {required this.description,
      required this.name,
      required this.price,
      this.washerName,
      this.sizeName,
      required this.washerId,
      required this.sizeId,
      required this.serviceId});
}
