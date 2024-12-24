import 'package:best_touch_training/core/locale/app_locale.dart';
import 'package:best_touch_training/core/routes/routes.dart';
import 'package:best_touch_training/core/service_locator/service_locator.dart';
import 'package:best_touch_training/core/shared_widgets/custom_dialog.dart';
import 'package:best_touch_training/core/shared_widgets/custom_elevated_button.dart';
import 'package:best_touch_training/core/shared_widgets/custom_form_field.dart';
import 'package:best_touch_training/core/shared_widgets/custom_label_text.dart';
import 'package:best_touch_training/core/shared_widgets/custom_loading_indicator.dart';
import 'package:best_touch_training/core/shared_widgets/simple_appbar.dart';
import 'package:best_touch_training/core/utils/app_colors.dart';
import 'package:best_touch_training/core/utils/app_images.dart';
import 'package:best_touch_training/core/utils/app_strings.dart';
import 'package:best_touch_training/core/utils/app_text_style.dart';
import 'package:best_touch_training/core/utils/common_widgets.dart';
import 'package:best_touch_training/core/utils/extensions.dart';
import 'package:best_touch_training/core/validation/validation.dart';
import 'package:best_touch_training/features/auth/data/models/new_password_model/reset_password_request.dart';
import 'package:best_touch_training/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:best_touch_training/features/auth/presentation/screens/components/custom_title_text..dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key, required this.resetToken});
  final String resetToken;
  @override
  Widget build(BuildContext context) {
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPassController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: SimpleAppBar(
        context: context,
        leading: true,
      ),
      body: SingleChildScrollView(
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is ResetPasswordSuccessState) {
              showToast(
                  msg: "تم تغيير كلمه المرور بنجاح",
                  state: ToastStates.success);
              // showDialog(
              //     context: context,
              //     builder: (context) => CustomDialogWidget(
              //           image: AppAssets.resetPasswordSuccessfully,
              //           title: AppStrings.passwordResetSuccessfully.tr(context),
              //         ));
              navigate(context: context, route: Routes.login);
            } else if (state is ResetPasswordErrorState) {
              showToast(msg: state.message, state: ToastStates.error);
            }
          },
          builder: (context, state) {
            return Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTitleText(text: AppStrings.newPassword.tr(context)),
                  16.verticalSpace,
                  Text(
                    AppStrings.enterNewPassword.tr(context),
                    style: semiBold(size: 16, color: AppColors.deepGrey),
                  ),
                  30.verticalSpace,
                  CustomLabelText(
                    text: AppStrings.newPassword.tr(context),
                  ),
                  4.verticalSpace,
                  CustomTextFormField(
                      validator: (val) => ValidationHelper.validate(val),
                      hint: '*********',
                      controller: passwordController),
                  16.verticalSpace,
                  CustomLabelText(
                    text: AppStrings.confirmPassword.tr(context),
                  ),
                  4.verticalSpace,
                  CustomTextFormField(
                      validator: (val) => ValidationHelper.validate(val),
                      hint: 'FG_12345',
                      controller: confirmPassController),
                  40.verticalSpace,
                  state is ResetPasswordLoadingState
                      ? const CustomLoadingIndicator()
                      : CustomElevatedButton(
                          onPress: () {
                            if (formKey.currentState!.validate()) {
                              sl<AuthCubit>().resetPassword(
                                  ResetPasswordRequest(
                                      resetToken: resetToken,
                                      password: passwordController.text,
                                      passwordConfirmation:
                                          confirmPassController.text));
                            }
                          },
                          text: AppStrings.confirm.tr(context),
                        )
                ],
              ),
            );
          },
        ),
      ).paddingAll(10),
    );
  }
}
