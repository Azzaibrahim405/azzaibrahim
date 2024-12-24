import 'package:best_touch_training/core/locale/app_locale.dart';
import 'package:best_touch_training/core/routes/routes.dart';
import 'package:best_touch_training/core/shared_widgets/custom_elevated_button.dart';
import 'package:best_touch_training/core/shared_widgets/custom_loading_indicator.dart';
import 'package:best_touch_training/core/shared_widgets/custom_text_button.dart';
import 'package:best_touch_training/core/shared_widgets/simple_appbar.dart';
import 'package:best_touch_training/core/utils/app_colors.dart';
import 'package:best_touch_training/core/utils/app_strings.dart';
import 'package:best_touch_training/core/utils/app_text_style.dart';
import 'package:best_touch_training/core/utils/common_widgets.dart';
import 'package:best_touch_training/core/utils/extensions.dart';
import 'package:best_touch_training/core/validation/validation.dart';
import 'package:best_touch_training/features/auth/data/models/verification_code_model/verification_rerquest.dart';
import 'package:best_touch_training/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:best_touch_training/features/auth/presentation/screens/components/custom_title_text..dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationCodeScreen extends StatelessWidget {
  const VerificationCodeScreen({super.key, required this.phone});
  final String phone;

  @override
  Widget build(BuildContext context) {
    TextEditingController pinCodeController = TextEditingController();
    var formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: SimpleAppBar(
        context: context,
        leading: true,
      ),
      body: Form(
        key: formKey,
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is VerificationFromPasswordSuccessState) {
              Navigator.pushNamed(context, Routes.newPassword,
                  arguments: BlocProvider.of<AuthCubit>(context).resetToken);

              showToast(  
                  msg: 'لقد تم التحقق من شفره الدخول بنجاح',
                  state: ToastStates.success);
            } else if (state is VerificationFromPasswordErrorState) {
              showToast(msg: state.message, state: ToastStates.error);
            }
          },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomTitleText(text: AppStrings.otp),
                16.verticalSpace,
                Text(
                  ' ${AppStrings.pleaseEnterOtp.tr(context)}$phone *****',
                  style: semiBold(size: 16, color: AppColors.deepGrey),
                ),
                32.verticalSpace,
                PinCodeTextField(
                  // onCompleted: (value) {
                  // },
                  errorTextDirection: TextDirection.ltr,
                  controller: pinCodeController,
                  onChanged: (String value) {},
                  appContext: context,
                  length: 4,
                  validator: (String? value) =>
                      ValidationHelper.pinCodeValidat(value ?? ''),
                  blinkWhenObscuring: true,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    selectedColor: AppColors.primary,
                    inactiveColor: AppColors.hintColor,
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(4.r),
                    fieldHeight: 72.sp,
                    fieldWidth: 80.sp,
                    borderWidth: 0,
                    activeColor: AppColors.primary,
                    inactiveFillColor: AppColors.primary,
                  ),
                  cursorColor: AppColors.primary,
                  animationDuration: const Duration(milliseconds: 300),
                  autoDisposeControllers: false,

                  boxShadows: const [],
                  keyboardType: TextInputType.number,
                ),
                40.verticalSpace,
                state is VerificationFromPasswordLoadingState
                    ? const CustomLoadingIndicator()
                    : CustomElevatedButton(
                        onPress: () {
                          BlocProvider.of<AuthCubit>(context)
                              .verificationFromForgetPassword(
                                  VerificationRerquest(
                            code: pinCodeController.text,
                            phone: phone,
                          ));
                        },
                        text: AppStrings.next.tr(context),
                      ),
                40.verticalSpace,
                Align(
                  alignment: Alignment.center,
                  child: CustomTextButton(
                    onPress: () {
                      

                    },
                    text: AppStrings.resend.tr(context),
                    isUnderline: true,
                  ),
                )
              ],
            );
          },
        ).paddingAll(10),
      ),
    );
  }
}
