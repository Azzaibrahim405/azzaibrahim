import 'package:best_touch_training/core/database/remote/api_consumer.dart';
import 'package:best_touch_training/core/database/remote/api_keys.dart';
import 'package:best_touch_training/core/database/remote/end_points.dart';
import 'package:best_touch_training/core/error/exceptions.dart';
import 'package:best_touch_training/core/service_locator/service_locator.dart';
import 'package:best_touch_training/features/home/data/models/get_all_washers/get_all_washers_model/washers_data_model.dart';
import 'package:best_touch_training/features/home/data/models/sliders_model/sliders_model/sliders_model.dart';
import 'package:dartz/dartz.dart';

class HomeRepository {
  Future<Either<String, SlidersModel>> getSliders() async {
    try {
      final response = await sl<ApiConsumer>().get(
        EndPoints.sliders,
      );
      return Right(SlidersModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    }
  }

  Future<Either<String, WashersDataModel>> getAllWashers(
      {required double lat, required double long}) async {
    try {
      final response = await sl<ApiConsumer>().get(EndPoints.allWashers,
          queryParameters: {ApiKeys.lat: lat, ApiKeys.long: long});
      return right(WashersDataModel.fromJson(response["data"]));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    }
  }
}
