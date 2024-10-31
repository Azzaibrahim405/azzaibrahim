import 'package:best_touch_training/features/notifications/data/models/get_all_notifications_model/notification_item.dart';
import 'package:best_touch_training/features/notifications/data/repository/notifications_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit(this.notificationsRepo) : super(NotificationsInitial());
  final NotificationsRepository notificationsRepo;
  List<NotificationItemModel> notifications = [];
  void getAllNotifications() async {
    emit(NotificationsLoadingState());
    final result = await notificationsRepo.getAllNotifications();
    result.fold(
      (left) {
        emit(NotificationsErrorState(left));
      },
      (right) {
        notifications = right.data ?? [];

        emit(NotificationsSuccessState(notifications));
      },
    );
  }
}
