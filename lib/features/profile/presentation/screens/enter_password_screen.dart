import 'package:best_touch_training/core/routes/routes.dart';
import 'package:best_touch_training/core/shared_widgets/custom_elevated_button.dart';
import 'package:best_touch_training/core/shared_widgets/custom_form_field.dart';
import 'package:best_touch_training/core/shared_widgets/custom_loading_indicator.dart';
import 'package:best_touch_training/core/shared_widgets/simple_appbar.dart';
import 'package:best_touch_training/core/utils/app_images.dart';
import 'package:best_touch_training/core/utils/common_widgets.dart';
import 'package:best_touch_training/core/utils/extensions.dart';
import 'package:best_touch_training/features/profile/presentation/cubit/cubit/update_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class EnterPasswordScreen extends StatelessWidget {
  const EnterPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController passwordController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: SimpleAppBar(
        context: context,
        leading: true,
        title: 'ادخل كلمه المرور',
      ),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.verticalSpace,
              CustomTextFormField(
                prefix: SvgPicture.asset(AppAssets.unlock).paddingAll(10),
                hint: '*****',
                controller: passwordController,
                isPassword: true,
              ),
              24.verticalSpace,
              BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
                builder: (context, state) {
                  if (state is DeleteAccountLoadingState) {
                    return const CustomLoadingIndicator();
                  } else if (state is DeleteAccountErrorState) {
                    showToast(msg: state.message, state: ToastStates.error);
                  }
                  return CustomElevatedButton(
                    onPress: () {
                      if (formKey.currentState!.validate()) {
                        context
                            .read<UpdateProfileCubit>()
                            .deleteAccount(passwordController.text);
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          Routes.login,
                          (route) => false,
                        );
                        showToast(
                            msg: "تم حذف الحساب بنجاح",
                            state: ToastStates.success);
                      }
                    },
                    text: ' تأكيد الحذف ',
                  );
                },
              )
            ],
          ).paddingAll(10),
        ),
      ),
    );
  }
}
