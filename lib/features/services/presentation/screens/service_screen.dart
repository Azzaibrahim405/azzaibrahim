import 'dart:developer';

import 'package:best_touch_training/core/service_locator/service_locator.dart';
import 'package:best_touch_training/core/shared_widgets/custom_loading_indicator.dart';
import 'package:best_touch_training/core/shared_widgets/simple_appbar.dart';

import 'package:best_touch_training/core/utils/common_widgets.dart';
import 'package:best_touch_training/core/utils/extensions.dart';
import 'package:best_touch_training/features/laundry_profile/presentation/screens/widgets/cars_type_widget.dart';
import 'package:best_touch_training/features/services/presentation/cubit/service/services_cubit.dart';
import 'package:best_touch_training/features/services/presentation/screens/widgets/service_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceScreen extends StatefulWidget {
  final ServiceParams serviceParams;

  const ServiceScreen({super.key, required this.serviceParams});

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  @override
  void initState() {
    sl<ServicesCubit>().getServiceWasher(
      sizeId: widget.serviceParams.sizeId,
      washerId: widget.serviceParams.washerId,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log('size id is "${widget.serviceParams.sizeId}"');
    return Scaffold(
      appBar: SimpleAppBar(
        context: context,
        title: widget.serviceParams.name,
      ),
      body:
          BlocBuilder<ServicesCubit, ServicesState>(builder: (context, state) {
        if (state is ServicesLoadingState) {
          return const CustomLoadingIndicator();
        } else if (state is ServicesErrorState) {
          showToast(msg: state.message, state: ToastStates.error);
        } else if (state is ServicesSuccessState) {
          return ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return ServiceItem(
                  serviceParams: widget.serviceParams,
                  serviceItemModel: state.servicesList[index],
                );
              },
              separatorBuilder: (context, index) => 16.verticalSpace,
              itemCount: state.servicesList.length);
        }
        return const Center(child: Text('errrrorrrrrr'));
      }).paddingSymmetric(16, 20),
    );
  }
}
