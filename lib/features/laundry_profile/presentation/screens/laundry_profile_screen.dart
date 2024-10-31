import 'package:best_touch_training/core/service_locator/service_locator.dart';
import 'package:best_touch_training/core/shared_widgets/custom_loading_indicator.dart';
import 'package:best_touch_training/core/utils/app_colors.dart';
import 'package:best_touch_training/core/utils/app_text_style.dart';
import 'package:best_touch_training/core/utils/common_widgets.dart';
import 'package:best_touch_training/core/utils/extensions.dart';
import 'package:best_touch_training/features/laundry_profile/presentation/cubit/cubit/car_sizes_cubit_cubit.dart';
import 'package:best_touch_training/features/laundry_profile/presentation/cubit/cubit/laundry_profile_cubit.dart';
import 'package:best_touch_training/features/laundry_profile/presentation/screens/widgets/cars_type_widget.dart';
import 'package:best_touch_training/features/laundry_profile/presentation/screens/widgets/carusel_slider.dart';
import 'package:best_touch_training/features/laundry_profile/presentation/screens/widgets/laundry_details.dart';
import 'package:best_touch_training/features/laundry_profile/presentation/screens/widgets/location_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LaundryProfileScreen extends StatefulWidget {
  final int id;

  const LaundryProfileScreen({super.key, required this.id});

  @override
  State<LaundryProfileScreen> createState() => _LaundryProfileScreenState();
}

class _LaundryProfileScreenState extends State<LaundryProfileScreen> {
  @override
  void initState() {
    sl<LaundryProfileCubit>().getLaundryProfile(widget.id);
    sl<CarSizesCubitCubit>().getAllCarsTypes();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //var laundryProfile = sl<LaundryProfileCubit>().laundryProfileDetails;
    // Controller for CarouselSlider
    return BlocBuilder<LaundryProfileCubit, LaundryProfileState>(
      builder: (context, state) {
        if (state is LaundryProfileLoadingState) {
          return const CustomLoadingIndicator();
        } else if (state is LaundryProfileErrorState) {
          showToast(
              msg: 'خطأ في تحميل بروفايل المغسله', state: ToastStates.error);
        } else if (state is LaundryProfileSuccessState) {
          return Scaffold(
              body: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                color: Colors.white,
                height: double.infinity,
              ),
              const CaruselSliderWidget(),
              Positioned(
                top: 220.h,
                left: 0,
                right: 0,
                bottom: 0,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30))),
                        child: Column(
                          children: [
                            LaundryDetailsWidget(
                              laundryDetails: state.laundryDetails,
                            ),
                            24.verticalSpace,
                            Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                state.laundryDetails.description ?? '',
                                style: regularStyle(
                                    size: 12, color: AppColors.greyColor),
                              ).paddingHorizontal(16),
                            ),
                            24.verticalSpace,
                            Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                'أنواع السيارات',
                                style: semiBold(
                                    size: 16, color: AppColors.labelTextColor),
                              ).paddingHorizontal(16),
                            ),
                            16.verticalSpace,
                            BlocBuilder<CarSizesCubitCubit, CarSizesCubitState>(
                              builder: (context, state) {
                                if (state is CarsTypesLoadingState) {
                                  return const CustomLoadingIndicator();
                                } else if (state is CarsTypesErrorState) {
                                  showToast(
                                      msg: state.message,
                                      state: ToastStates.error);
                                } else if (state is CarsTypesSuccessState) {
                                  return Expanded(
                                    child: ListView.separated(
                                        scrollDirection: Axis.vertical,
                                        itemBuilder: (context, index) {
                                          return CarsTypeWidget(
                                            carData: state.carsSizes[index],
                                          );
                                        },
                                        separatorBuilder: (context, index) =>
                                            16.verticalSpace,
                                        itemCount: context
                                            .read<CarSizesCubitCubit>()
                                            .cars
                                            .length),
                                  );
                                }
                                return const Text('');
                              },
                            )
                          ],
                        ).paddingVertical(16)),
                    const LocationWidget()
                  ],
                ),
              ),
            ],
          ));
        }
        return const SizedBox();
      },
    );
  }
}
