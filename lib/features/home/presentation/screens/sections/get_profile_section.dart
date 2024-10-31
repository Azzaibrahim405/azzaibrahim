import 'package:best_touch_training/core/utils/common_widgets.dart';
import 'package:best_touch_training/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:best_touch_training/features/home/presentation/screens/components/custom_profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class getprofilesection extends StatelessWidget {
  const getprofilesection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is GetProfileSuccessState) {
          return CustomProfileWidget(state.profileData);
        } else if (state is GetProfileErrorState) {
          showToast(msg: state.message, state: ToastStates.error);
        }
        return const Text("");
      },
    );
  }
}
