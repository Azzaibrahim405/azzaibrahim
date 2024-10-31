import 'dart:developer';

import 'package:best_touch_training/core/database/local/cache_helper.dart';
import 'package:best_touch_training/core/database/remote/api_keys.dart';
import 'package:best_touch_training/core/service_locator/service_locator.dart';
import 'package:best_touch_training/features/auth/data/models/get_profile_model/get_profile_model/profile_data.dart';
import 'package:best_touch_training/features/auth/data/models/login_model/login_request.dart';
import 'package:best_touch_training/features/auth/data/models/login_model/user.dart';
import 'package:best_touch_training/features/auth/data/models/new_password_model/reset_password_request.dart';
import 'package:best_touch_training/features/auth/data/models/register_model/register_request.dart';
import 'package:best_touch_training/features/auth/data/models/verification_code_model/verification_rerquest.dart';
import 'package:best_touch_training/features/auth/data/repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());
  final AuthRepository authRepo;

  User? user;
  void login(LoginRequest loginRequest) async {
    emit(AuthLoadingState());
    final result = await authRepo.login(loginRequest);
    result.fold(
      (l) {
        emit(AuthErrorState(l));
      },
      (r) async {
        await sl<CacheHelper>().saveData(key: ApiKeys.token, value: r.token);
        log("${r.token}mmmmmmm");
        log(sl<CacheHelper>().getData(key: ApiKeys.token).toString());

        // log(message);
        emit(AuthSuccesState());
      },
    );
  }

  void register(RegisterRequest registerRequest) async {
    emit(RegisterLoadingState());
    final result = await authRepo.register(registerRequest);
    result.fold(
      (l) {
        emit(RegisterErrorState(l));
      },
      (r) {
        log("${r.code}mmmmmmmmmmmmm ");
        emit(RegisterSuccesState());
      },
    );
  }

  void forgetPassword({required String phone}) async {
    emit(ForgetPasswordLoadingState());
    final result = await authRepo.forgetPassword(phone);
    result.fold(
      (l) {
        emit(ForgetPasswordErrorState(l));
      },
      (r) {
        log(r.resetCode.toString());
        emit(ForgetPasswordSuccessState());
      },
    );
  }

  String? resetToken;
  String? code;
  void verificationFromForgetPassword(
      VerificationRerquest verificationRequest) async {
    emit(VerificationFromPasswordLoadingState());
    final result =
        await authRepo.verificationFromForgetPassword(verificationRequest);

    result.fold(
      (left) {
        emit(VerificationFromPasswordErrorState(left));
      },
      (right) {
        code = right.code ?? '';
        resetToken = right.resetToken ?? '';
        log("${right.resetToken}aaaazzzzzzaaaaa");
        emit(VerificationFromPasswordSuccessState());
      },
    );
  }

  void resetPassword(ResetPasswordRequest resetPasswordRequest) async {
    emit(ResetPasswordLoadingState());
    final result = await authRepo.resetPassword(resetPasswordRequest);

    result.fold(
      (left) {
        emit(ResetPasswordErrorState(left));
      },
      (right) {
        emit(ResetPasswordSuccessState());
      },
    );
  }

  ProfileData? userProfile;
  void getProfileUser() async {
    emit(GetProfileLoadingState());
    final result = await authRepo.getProfileData();
    result.fold(
      (left) {
        emit(GetProfileErrorState(left));
      },
      (userprofilee) {
        emit(GetProfileSuccessState(userprofilee));
        userProfile = userprofilee;
        // onSuccess?.call();
        log(userProfile.toString());
      },
    );
  }
}
