import 'package:best_touch_training/core/database/remote/api_consumer.dart';
import 'package:best_touch_training/core/database/remote/api_keys.dart';
import 'package:best_touch_training/core/database/remote/end_points.dart';
import 'package:best_touch_training/core/error/exceptions.dart';
import 'package:best_touch_training/core/service_locator/service_locator.dart';
import 'package:best_touch_training/features/profile/data/models/delete_account_model.dart';
import 'package:best_touch_training/features/profile/data/models/update_profile_model/update_profile_data.dart';
import 'package:best_touch_training/features/profile/data/models/update_profile_model/update_profile_request.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class UpdateProfileRepository {
  Future<Either<String, UpdateProfileData>> updateProfile(
      UpdateProfileRequest updateProfileRequest) async {
    try {
      final response = await sl<ApiConsumer>()
          .post(EndPoints.updateProfile, data: updateProfileRequest.toJson());
      return Right(UpdateProfileData.fromJson(response['data']));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    }
  }

  Future<Either<String, DeleteAccountModel>> deleteAccount(
      {required String password}) async {
    try {
      final response = await sl<ApiConsumer>().post(EndPoints.deleteAccount,
          data: FormData.fromMap({ApiKeys.password: password}));
      return Right(DeleteAccountModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    }
  }
}
