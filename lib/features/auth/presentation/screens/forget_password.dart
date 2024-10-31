import 'package:best_touch_training/core/locale/app_locale.dart';
import 'package:best_touch_training/core/routes/routes.dart';
import 'package:best_touch_training/core/shared_widgets/custom_elevated_button.dart';
import 'package:best_touch_training/core/shared_widgets/custom_form_field.dart';
import 'package:best_touch_training/core/shared_widgets/custom_label_text.dart';
import 'package:best_touch_training/core/shared_widgets/custom_loading_indicator.dart';
import 'package:best_touch_training/core/shared_widgets/simple_appbar.dart';
import 'package:best_touch_training/core/utils/app_colors.dart';
import 'package:best_touch_training/core/utils/app_strings.dart';
import 'package:best_touch_training/core/utils/app_text_style.dart';
import 'package:best_touch_training/core/utils/common_widgets.dart';
import 'package:best_touch_training/core/utils/extensions.dart';
import 'package:best_touch_training/core/validation/validation.dart';
import 'package:best_touch_training/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:best_touch_training/features/auth/presentation/screens/components/custom_title_text..dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController phoneController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    var authCubit = BlocProvider.of<AuthCubit>(context);
    return Scaffold(
      appBar: SimpleAppBar(
        context: context,
        leading: true,
      ),
      body: Form(
        key: formKey,
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is ForgetPasswordSuccessState) {
              Navigator.pushNamed(context, Routes.verificationCode,
                  arguments: phoneController.text);

              return showToast(
                  msg: 'تم ارساله رمز استعاده كلمه المرور بتجاح',
                  state: ToastStates.success);
            } else if (state is ForgetPasswordErrorState) {
              return showToast(msg: state.message, state: ToastStates.error);
            }
          },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomTitleText(text: AppStrings.forgetPassword),
                16.verticalSpace,
                Text(
                  AppStrings.registerPhone.tr(context),
                  style: semiBold(size: 16, color: AppColors.deepGrey),
                ),
                30.verticalSpace,
                CustomLabelText(
                  text: AppStrings.phone.tr(context),
                ),
                4.verticalSpace,
                CustomTextFormField(
                    validator: (val) => ValidationHelper.validate(val),
                    hint: AppStrings.enterYourPhone.tr(context),
                    controller: phoneController),
                40.verticalSpace,
                state is ForgetPasswordLoadingState
                    ? const CustomLoadingIndicator()
                    : CustomElevatedButton(
                        onPress: () {
                          if (formKey.currentState!.validate()) {
                            authCubit.forgetPassword(
                                phone: phoneController.text);
                          }
                        },
                        text: AppStrings.next.tr(context))
              ],
            );
          },
        ).paddingAll(16),
      ),
    );
  }
}
