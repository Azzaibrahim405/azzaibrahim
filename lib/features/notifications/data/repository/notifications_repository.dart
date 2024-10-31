import 'package:best_touch_training/core/database/remote/api_consumer.dart';
import 'package:best_touch_training/core/database/remote/end_points.dart';
import 'package:best_touch_training/core/error/exceptions.dart';
import 'package:best_touch_training/core/service_locator/service_locator.dart';
import 'package:best_touch_training/features/notifications/data/models/get_all_notifications_model/notifications_list_model.dart';
import 'package:dartz/dartz.dart';

class NotificationsRepository {
  Future<Either<String, NotificationsListModel>> getAllNotifications() async {
    try {
      final response = await sl<ApiConsumer>().get(EndPoints.allNotifications);
      return Right(NotificationsListModel.fromJson(response["data"]));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    }
  }
}
