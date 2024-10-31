import 'package:best_touch_training/core/routes/routes.dart';
import 'package:best_touch_training/core/shared_widgets/custom_elevated_button.dart';
import 'package:best_touch_training/core/utils/app_colors.dart';
import 'package:best_touch_training/core/utils/app_text_style.dart';
import 'package:best_touch_training/core/utils/common_widgets.dart';
import 'package:best_touch_training/core/utils/extensions.dart';
import 'package:best_touch_training/features/laundry_profile/data/models/cars_types_model/car_data.dart';
import 'package:best_touch_training/features/laundry_profile/presentation/cubit/cubit/laundry_profile_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarsTypeWidget extends StatelessWidget {
  const CarsTypeWidget({super.key, required this.carData});
  final CarData? carData;
  @override
  Widget build(BuildContext context) {
    var landryDetails =
        context.read<LaundryProfileCubit>().laundryProfileDetails;

    return Card(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CachedNetworkImage(
                imageUrl: carData?.image ?? '',
                fit: BoxFit.cover,
                width: 50,
              ),
              10.horizontalSpace,
              Column(
                children: [
                  Text(
                    carData?.name ?? '',
                    style: boldStyle(color: AppColors.labelTextColor, size: 16),
                  ),
                  4.verticalSpace,
                  Text(
                    carData?.description ?? '',
                    style: regularStyle(size: 12, color: AppColors.greyColor),
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            width: 100,
            child: CustomElevatedButton(
              onPress: () {
                navigate(
                    context: context,
                    route: Routes.services,
                    args: ServiceParams(
                        sizeId: carData?.id,
                        washerId: landryDetails?.id,
                        name: carData?.name));
              },
              text: 'أختر',
            ),
          )
        ],
      ).paddingSymmetric(30, 20),
    );
  }
}

class ServiceParams {
  final int? sizeId;
  final String? name;
  final int? washerId;

  ServiceParams(
      {required this.sizeId, required this.washerId, required this.name});
}
