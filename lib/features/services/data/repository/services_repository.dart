import 'package:best_touch_training/core/database/remote/api_consumer.dart';
import 'package:best_touch_training/core/database/remote/end_points.dart';
import 'package:best_touch_training/core/error/exceptions.dart';
import 'package:best_touch_training/core/service_locator/service_locator.dart';
import 'package:best_touch_training/features/services/data/models/additions_model/addtions_services_model/addtions_services_model.dart';
import 'package:best_touch_training/features/services/data/models/confirmation_order_model/confirmation_order_model.dart';
import 'package:best_touch_training/features/services/data/models/get_service_model/get_service_model.dart';
import 'package:best_touch_training/features/services/data/models/order_request_body.dart';
import 'package:dartz/dartz.dart';

class ServicesRepository {
  Future<Either<String, GetServiceModel>> getServiceWasher(
      dynamic sizeId, dynamic washerId) async {
    try {
      final response = await sl<ApiConsumer>()
          .get(EndPoints.getService(sizeId: sizeId, washerId: washerId));
      return Right(GetServiceModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    }
  }

  Future<Either<String, AddtionsServicesModel>> getAdditionsServices({
    required int serviceId,
    required int washerId,
    required int sizeId,
  }) async {
    try {
      var response = await sl<ApiConsumer>().get(EndPoints.getAdditionsServives(
        serviceId: serviceId,
        washerId: washerId,
        sizeId: sizeId,
      ));
      return Right(AddtionsServicesModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    }
  }

  Future<Either<String, ConfirmationOrderModel>> orderConfirmation(
      OrderBody orderBody) async {
    try {
      final response = await sl<ApiConsumer>()
          .post(EndPoints.ordersConfirmation, data: orderBody.toJson());
      return Right(ConfirmationOrderModel.fromJson(response['data']));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    }
  }
}
