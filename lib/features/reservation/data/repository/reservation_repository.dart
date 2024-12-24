import 'package:best_touch_training/core/database/remote/api_consumer.dart';
import 'package:best_touch_training/core/database/remote/end_points.dart';
import 'package:best_touch_training/core/error/exceptions.dart';
import 'package:best_touch_training/core/service_locator/service_locator.dart';
import 'package:best_touch_training/core/utils/enums.dart';
import 'package:best_touch_training/features/reservation/data/models/reservation_model/reservation_model.dart';
import 'package:dartz/dartz.dart';

class ReservationRepository {
  Future<Either<String, ReservationModel>> getAllReservations(
      {required String status}) async {
    try {
      final response =
          await sl<ApiConsumer>().get(EndPoints.getAllOrders(status: status));
      return Right(ReservationModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    }
  }
}
