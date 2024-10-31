part of 'notifications_cubit.dart';

@immutable
sealed class NotificationsState {}

final class NotificationsInitial extends NotificationsState {}

final class NotificationsLoadingState extends NotificationsState {}

final class NotificationsSuccessState extends NotificationsState {
  List<NotificationItemModel> notificationsList;
  NotificationsSuccessState(this.notificationsList);
}

final class NotificationsErrorState extends NotificationsState {
  String message;
  NotificationsErrorState(this.message);
}
