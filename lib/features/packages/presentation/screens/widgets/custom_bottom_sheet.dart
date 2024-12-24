import 'package:best_touch_training/core/shared_widgets/custom_loading_indicator.dart';
import 'package:best_touch_training/core/utils/app_colors.dart';
import 'package:best_touch_training/core/utils/app_text_style.dart';
import 'package:best_touch_training/core/utils/extensions.dart';
import 'package:best_touch_training/features/home/presentation/cubit/cubit/washers_cubit/washers_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({super.key});

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  int selectedValue = 1;
  @override
  void initState() {
    context.read<WashersCubit>().getAllWashers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WashersCubit, WashersState>(
      builder: (context, state) {
        return Container(
          width: double.infinity,
          decoration: const BoxDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'اختار المغسله',
                style: semiBold(size: 16, color: AppColors.labelTextColor),
              ),
              20.verticalSpace,
              state is GetAllWahersSuccessState
                  ? Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Radio(
                                    value: 2,
                                    groupValue: selectedValue,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedValue = value!;
                                      });
                                    }),
                                Text(
                                  state.allWashers[index].name ?? '',
                                  style: regularStyle(
                                      size: 14,
                                      color: AppColors.labelTextColor),
                                ),
                              ],
                            );
                          },
                          separatorBuilder: (context, index) =>
                              16.verticalSpace,
                          itemCount: state.allWashers.length),
                    )
                  : const CustomLoadingIndicator()
            ],
          ).paddingAll(16),
        );
      },
    );
  }
}
