import 'dart:developer';

import 'package:best_touch_training/core/database/remote/api_consumer.dart';
import 'package:best_touch_training/core/database/remote/api_keys.dart';
import 'package:best_touch_training/core/database/remote/end_points.dart';
import 'package:best_touch_training/core/error/exceptions.dart';
import 'package:best_touch_training/core/service_locator/service_locator.dart';
import 'package:best_touch_training/features/auth/data/models/forget_password_model/forget_password_model/data.dart';
import 'package:best_touch_training/features/auth/data/models/get_profile_model/get_profile_model/profile_data.dart';
import 'package:best_touch_training/features/auth/data/models/login_model/login_request.dart';
import 'package:best_touch_training/features/auth/data/models/login_model/user.dart';
import 'package:best_touch_training/features/auth/data/models/new_password_model/reset_password_model/reset_password_data.dart';
import 'package:best_touch_training/features/auth/data/models/new_password_model/reset_password_request.dart';
import 'package:best_touch_training/features/auth/data/models/register_model/register_model/register_data.dart';
import 'package:best_touch_training/features/auth/data/models/register_model/register_request.dart';
import 'package:best_touch_training/features/auth/data/models/verification_code_model/verification_code_data.dart';
import 'package:best_touch_training/features/auth/data/models/verification_code_model/verification_rerquest.dart';
import 'package:dartz/dartz.dart';
class AuthRepository {
  Future<Either<String, User>> login(LoginRequest loginRequest) async {
    try {
      final response = await sl<ApiConsumer>()
          .post(EndPoints.login, data: loginRequest.toJson());

      return Right(User.fromJson(response['data']));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    }
  }

  Future<Either<String, RegisterData>> register(
      RegisterRequest registerRequest) async {
    try {
      var response = await sl<ApiConsumer>()
          .post(EndPoints.register, data: registerRequest.toJson());
      return right(RegisterData.fromJson(response['data']));
    } on ServerException catch (e) {
      return left(e.errorModel.message);
    }
  }

  Future<Either<String, ForgetPasswordData>> forgetPassword(
      String phone) async {
    try {
      final response = await sl<ApiConsumer>()
          .post(EndPoints.forgetPassword, data: {ApiKeys.phone: phone});
      log(response['data'].toString());
      return right(ForgetPasswordData.fromJson(response['data']));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    }
  }
// veification code method from forget password

  Future<Either<String, VerificationCodeData>> verificationFromForgetPassword(
      VerificationRerquest verificationRequest) async {
    try {
      var response = await sl<ApiConsumer>().post(
          EndPoints.verificationFromPassword,
          data: verificationRequest.toJson());

      return Right(VerificationCodeData.fromJson(response['data']));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    }
  }

  Future<Either<String, ResetPasswordData>> resetPassword(
      ResetPasswordRequest resetPasswordRequest) async {
    try {
      var response = await sl<ApiConsumer>()
          .post(EndPoints.resetPassword, data: resetPasswordRequest.toJson());
      return Right(ResetPasswordData.fromJson(response['data']));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    }
  }

  Future<Either<String, ProfileData>> getProfileData() async {
    try {
      final response = await sl<ApiConsumer>().get(
        EndPoints.getProfile,
      );
      if (response['message'] ==
          "أنت غير مسموح لك بالدخول ، يرجى تسجيل الدخول") {
        // navigate(context: context, route: Routes.login);
        return const Left("User is not authorized. Please login.");
      }
      return Right(ProfileData.fromJson(response['data']));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    }
  }
}
