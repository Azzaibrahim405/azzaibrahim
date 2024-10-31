import 'dart:developer';

import 'package:best_touch_training/core/database/remote/api_consumer.dart';
import 'package:best_touch_training/core/database/remote/end_points.dart';
import 'package:best_touch_training/core/error/exceptions.dart';
import 'package:best_touch_training/core/service_locator/service_locator.dart';
import 'package:best_touch_training/features/laundry_profile/data/models/cars_types_model/cars_types_model.dart';
import 'package:best_touch_training/features/laundry_profile/data/models/laundry_profile_model/laundry_details.dart';
import 'package:dartz/dartz.dart';

class LauandryDetailsRepository {
  Future<Either<String, LaundryDetails>> getLaundryDetails(int id) async {
    try {
      final response =
          await sl<ApiConsumer>().get(EndPoints.profileLaundry(id));
      return right(LaundryDetails.fromJson(response['data']));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    }
  }

  Future<Either<String, CarsTypesModel>> getAllTypesCars() async {
    try {
      final response = await sl<ApiConsumer>().get(EndPoints.getAllTypesCars);
      log(response.toString());
      return Right(CarsTypesModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    }
  }
}
