import 'package:best_touch_training/core/database/local/cache_helper.dart';
import 'package:best_touch_training/core/database/remote/api_keys.dart';
import 'package:best_touch_training/core/service_locator/service_locator.dart';
import 'package:best_touch_training/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:best_touch_training/features/profile/data/models/update_profile_model/update_profile_data.dart';
import 'package:best_touch_training/features/profile/data/models/update_profile_model/update_profile_request.dart';
import 'package:best_touch_training/features/profile/data/repository/update_profile_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit(this.updateProfileRepo) : super(UpdateProfileInitial());
  final UpdateProfileRepository updateProfileRepo;
  UpdateProfileData? profileData;
  void updateProfile(
    UpdateProfileRequest? updateProfileRequest,
  ) async {
    emit(UpdateProfileLoadingState());
    final result = await updateProfileRepo.updateProfile(updateProfileRequest!);
    result.fold(
      (failure) {
        emit(UpdateProfileErrorState(failure));
      },
      (right) async {
        profileData = right;
        sl<AuthCubit>().getProfileUser();
        emit(UpdateProfileSuccessState());
      },
    );
  }

  void deleteAccount(String password) async {
    emit(DeleteAccountLoadingState());
    final result = await updateProfileRepo.deleteAccount(password: password);
    result.fold(
      (left) {
        emit(DeleteAccountErrorState(left));
      },
      (right) {
        sl<CacheHelper>().removeData(key: ApiKeys.token);

        emit(DeleteAccountSuccessState());
      },
    );
  }
}
