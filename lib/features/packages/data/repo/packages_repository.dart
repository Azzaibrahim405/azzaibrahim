import 'package:best_touch_training/core/database/remote/api_consumer.dart';
import 'package:best_touch_training/core/database/remote/end_points.dart';
import 'package:best_touch_training/core/error/exceptions.dart';
import 'package:best_touch_training/core/service_locator/service_locator.dart';
import 'package:best_touch_training/features/packages/data/models/form_data_model.dart';
import 'package:best_touch_training/features/packages/data/models/get_monthly_package_model/get_monthly_package_model.dart';
import 'package:best_touch_training/features/packages/data/models/public_packages_model/public_packages_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class PackagesRepository {
  Future<Either<String, PublicPackagesModel>> getPublicPackages() async {
    try {
      final response = await sl<ApiConsumer>().get(EndPoints.getPublicPackages);
      return Right(PublicPackagesModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    }
  }

  Future<Either<String, GetMonthlyPackageModel>> getMonthlyPackage() async {
    try {
      final response = await sl<ApiConsumer>().get(EndPoints.monthlyPackage);
      return Right(GetMonthlyPackageModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    }
  }

  Future<Either<String, void>> storeFormData(
      FormDataModel formDataModel) async {
    try {
      final response = await sl<ApiConsumer>().post(EndPoints.store,
          data: FormData.fromMap(await formDataModel.azza()));
      return const Right(null);
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    }
  }
}
