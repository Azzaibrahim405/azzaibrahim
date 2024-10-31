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
import 'package:best_touch_training/features/auth/data/models/register_model/register_request.dart';
import 'package:best_touch_training/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:best_touch_training/features/auth/presentation/screens/components/actions_widget.dart';
import 'package:best_touch_training/features/auth/presentation/screens/components/custom_title_text..dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController userNameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController locationController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    var formKey = GlobalKey<FormState>();

    return Scaffold(
        appBar: SimpleAppBar(
          context: context,
          leading: false,
          actions: const [ActionsWidget()],
        ),
        body: SingleChildScrollView(
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is RegisterSuccesState) {
                showToast(
                    msg: "لقد تم انشاء حساب جديد بنجاح",
                    state: ToastStates.success);
                navigate(context: context, route: Routes.home);
              } else if (state is RegisterErrorState) {
                showToast(msg: state.message, state: ToastStates.error);
              }
            },
            builder: (context, state) {
              return Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomTitleText(text: AppStrings.register),
                    16.verticalSpace,
                    Text(AppStrings.entertherequiredfilds.tr(context)),
                    30.verticalSpace,
                    CustomLabelText(text: AppStrings.userName.tr(context)),
                    4.verticalSpace,
                    CustomTextFormField(
                        validator: (val) => ValidationHelper.validate(val),
                        hint: AppStrings.userName.tr(context),
                        prefix:
                            SvgPicture.asset(AppAssets.profile).paddingAll(10),
                        controller: userNameController),
                    16.verticalSpace,
                    CustomLabelText(
                      text: AppStrings.phone.tr(context),
                    ),
                    4.verticalSpace,
                    CustomTextFormField(
                        validator: (val) => ValidationHelper.validate(val),
                        isPassword: true,
                        hint: AppStrings.phone.tr(context),
                        controller: phoneController),
                    CustomLabelText(
                      text: AppStrings.password.tr(context),
                    ),
                    4.verticalSpace,
                    CustomTextFormField(
                        validator: (val) => ValidationHelper.validate(val),
                        isPassword: true,
                        prefix:
                            SvgPicture.asset(AppAssets.unlock).paddingAll(10),
                        hint: AppStrings.password.tr(context),
                        controller: passwordController),
                    16.verticalSpace,
                    CustomLabelText(
                        text: AppStrings.confirmPassword.tr(context)),
                    4.verticalSpace,
                    CustomTextFormField(
                        validator: (val) => ValidationHelper.validate(val),
                        isPassword: true,
                        prefix:
                            SvgPicture.asset(AppAssets.unlock).paddingAll(10),
                        hint: AppStrings.confirmPassword.tr(context),
                        controller: confirmPasswordController),
                    16.verticalSpace,
                    CustomLabelText(
                      text: AppStrings.location.tr(context),
                    ),
                    4.verticalSpace,
                    InkWell(
                      onTap: () {
                        navigate(context: context, route: Routes.location);
                      },
                      child: CustomTextFormField(
                          // maxLines: 2,
                          // maxLength: 55,
                          isEnable: false,
                          //validator: (val) => ValidationHelper.validate(val),
                          prefix: SvgPicture.asset(AppAssets.location)
                              .paddingAll(10),
                          hint: AppStrings.location.tr(context),
                          controller: locationController),
                    ),
                    40.verticalSpace,
                    state is RegisterLoadingState
                        ? const CustomLoadingIndicator()
                        : CustomElevatedButton(
                            onPress: () {
                              if (formKey.currentState!.validate()) {
                                BlocProvider.of<AuthCubit>(context)
                                    .register(RegisterRequest(
                                  Password: passwordController.text,
                                  name: userNameController.text,
                                  passwordConfirmation:
                                      confirmPasswordController.text,
                                  phone: phoneController.text,
                                ));
                              }
                            },
                            text: AppStrings.registerNow.tr(context),
                          ),
                    20.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.alreadyhaveanaccount.tr(context),
                          style: semiBold(
                              size: 14, color: AppColors.labelTextColor),
                        ),
                        CustomTextButton(
                          text: AppStrings.login.tr(context),
                          isUnderline: true,
                          onPress: () {
                            navigate(context: context, route: Routes.login);
                          },
                        )
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ).paddingAll(16));
  }
}
