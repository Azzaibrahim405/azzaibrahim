import 'package:best_touch_training/core/locale/app_locale.dart';
import 'package:best_touch_training/core/routes/routes.dart';
import 'package:best_touch_training/core/shared_widgets/custom_elevated_button.dart';
import 'package:best_touch_training/core/shared_widgets/custom_form_field.dart';
import 'package:best_touch_training/core/shared_widgets/custom_label_text.dart';
import 'package:best_touch_training/core/shared_widgets/custom_loading_indicator.dart';
import 'package:best_touch_training/core/shared_widgets/custom_text_button.dart';
import 'package:best_touch_training/core/shared_widgets/simple_appbar.dart';
import 'package:best_touch_training/core/utils/app_colors.dart';
import 'package:best_touch_training/core/utils/app_images.dart';
import 'package:best_touch_training/core/utils/app_strings.dart';
import 'package:best_touch_training/core/utils/app_text_style.dart';
import 'package:best_touch_training/core/utils/common_widgets.dart';
import 'package:best_touch_training/core/utils/extensions.dart';
import 'package:best_touch_training/core/validation/validation.dart';
import 'package:best_touch_training/features/auth/data/models/login_model/login_request.dart';
import 'package:best_touch_training/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:best_touch_training/features/auth/presentation/screens/components/actions_widget.dart';
import 'package:best_touch_training/features/auth/presentation/screens/components/custom_title_text..dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var authCubit = BlocProvider.of<AuthCubit>(context);
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: SimpleAppBar(
        leading: false,
        context: context,
        actions: const [ActionsWidget()],
      ),
      body: SingleChildScrollView(
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccesState) {
              showToast(
                  msg: AppStrings.loginSucess.tr(context),
                  state: ToastStates.success);
              Navigator.pushNamed(context, Routes.home);
            } else if (state is AuthErrorState) {
              showToast(msg: state.message, state: ToastStates.error);
            }
          },
          builder: (context, state) {
            return Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomTitleText(text: AppStrings.login),
                  20.verticalSpace,
                  Text(
                    AppStrings.enterPhoneAndPassword.tr(context),
                    style: semiBold(size: 16, color: AppColors.deepGrey),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomLabelText(
                    text: AppStrings.phone.tr(context),
                  ),
                  4.verticalSpace,
                  CustomTextFormField(
                    validator: (val) => ValidationHelper.validate(val),
                    hint: '5941230789',
                    controller: phoneController,
                  ),
                  16.verticalSpace,
                  CustomLabelText(
                    text: AppStrings.password.tr(context),
                  ),
                  4.verticalSpace,
                  CustomTextFormField(
                    validator: (val) => ValidationHelper.validate(val),
                    controller: passwordController,
                    isPassword: true,
                    prefix: SvgPicture.asset(AppAssets.unlock).paddingAll(12),
                    hint: '*********',
                  ),
                  8.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomTextButton(
                        isUnderline: true,
                        textColor: AppColors.greyColor,
                        onPress: () {
                          navigate(
                              context: context, route: Routes.forgetPassword);
                        },
                        text: AppStrings.forgetPassword.tr(context),
                      ),
                      10.verticalSpace,
                    ],
                  ),
                  10.verticalSpace,
                  state is AuthLoadingState
                      ? const CustomLoadingIndicator()
                      : CustomElevatedButton(
                          text: AppStrings.login.tr(context),
                          onPress: () {
                            if (formKey.currentState!.validate()) {
                              authCubit.login(LoginRequest(
                                  password: passwordController.text,
                                  phone: phoneController.text));
                            }
                          },
                        ),
                  24.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings.dontHaveAccount.tr(context),
                        style:
                            semiBold(size: 14, color: AppColors.labelTextColor),
                      ),
                      CustomTextButton(
                        onPress: () {
                          Navigator.pushNamed(context, Routes.register);
                        },
                        text: AppStrings.newAccount.tr(context),
                        isUnderline: true,
                      )
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ).paddingAll(16),
    );
  }
}
