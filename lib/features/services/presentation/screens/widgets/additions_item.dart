import 'package:best_touch_training/core/service_locator/service_locator.dart';
import 'package:best_touch_training/core/utils/app_colors.dart';
import 'package:best_touch_training/core/utils/app_text_style.dart';
import 'package:best_touch_training/features/services/data/models/additions_model/addtions_services_model/addition_model.dart';
import 'package:best_touch_training/features/services/presentation/cubit/additions_service/cubit/addition_services_cubit.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AdditionsItem extends StatelessWidget {
  final AdditionModel additionModel;
  final bool value;
  final Function(bool?)? onChanged;
  AdditionsItem(
      {super.key,
      required this.additionModel,
      required this.value,
      this.onChanged});

  var cubit = sl<AdditionServicesCubit>();

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(
        children: [
          Checkbox(
            value: value,
            onChanged: onChanged,
            checkColor: Colors.white, activeColor: AppColors.primary,

            side: const BorderSide(
              color: AppColors.greyColor,
            ),
            fillColor: MaterialStateProperty.all(
                value ? AppColors.primary : Colors.white), // لون ثابت
          ),
          Text(
            additionModel.name ?? '',
            style: regularStyle(size: 14, color: AppColors.greyColor),
          )
        ],
      ),
      Text(
        '${additionModel.price} ر.س ',
        style: semiBold(size: 16, color: AppColors.deepGrey),
      )
    ]);
  }
}
